using Gtk;
using Hdy;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/AppWindow.ui")]
    public class AppWindow : ApplicationWindow
    {
        [GtkChild] private Stack stack;
        [GtkChild] private Squeezer squeezer;
        [GtkChild] private ViewSwitcher headerbar_switcher;
        [GtkChild] private ViewSwitcherBar bottom_switcher;

        private CharacterInfoPage page_info;
        private CharacterSkillsPage page_skills;

        private CharacterSheet character;
        private string character_path;

        public AppWindow(Gtk.Application app)
        {
            Object(application: app);

            this.character = new CharacterSheet();
            this.character_path = null;

            set_help_overlay(new ShortcutsWindow());

            setup_style();
            setup_view();
            bind_character();
        }

        private void setup_style()
        {
            var provider = new Gtk.CssProvider();
            provider.load_from_resource("/io/github/trytonvanmeer/DungeonJournal/dungeonjournal.css");

            Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        private void setup_view()
        {
            this.page_info = new CharacterInfoPage();
            this.page_skills = new CharacterSkillsPage();

            this.stack.add_titled(this.page_info, "info", _("Info"));
            this.stack.child_set_property(this.page_info, "icon-name", "user-info-symbolic");

            this.stack.add_titled(this.page_skills, "skills", _("Skills"));
        }

        [GtkCallback]
        public void on_headerbar_squeezer_notify()
        {
            this.bottom_switcher.reveal = this.squeezer.visible_child != this.headerbar_switcher;
        }

        public void on_open()
        {
            open_character();
        }

        public void on_save()
        {
            if (this.character_path == null)
            {
                on_save_as();
            }
            else
            {
                save_character(this.character_path);
            }
        }

        public void on_save_as()
        {
            var dialog = new FileChooserNative(
                _("Save Character"),
                this,
                FileChooserAction.SAVE,
                _("_Save"),
                _("_Cancel")
            );

            dialog.set_current_name(this.character.name + ".json");
            dialog.set_do_overwrite_confirmation(true);

            if (dialog.run() == ResponseType.ACCEPT)
            {
                string path = dialog.get_file().get_path();

                save_character(path);
                this.character_path = path;
            }

            dialog.destroy();
        }

        private void bind_character()
        {
            this.page_info.bind_character(ref this.character);
            this.page_skills.bind_character(ref this.character);
        }

        private void open_character()
        {
            var dialog = new FileChooserNative(
                _("Open Character"),
                this,
                FileChooserAction.OPEN,
                _("_Open"),
                _("_Cancel")
            );

            var filter = new FileFilter();
            filter.add_mime_type("application/json");
            dialog.set_filter(filter);

            if (dialog.run() == Gtk.ResponseType.ACCEPT)
            {
                string path = dialog.get_file().get_path();

                try
                {
                    var parser = new Json.Parser();
                    parser.load_from_file(path);

                    Json.Node node = parser.get_root();
                    this.character = Json.gobject_deserialize(typeof (CharacterSheet), node) as CharacterSheet;
                    bind_character();

                    this.character_path = path;
                }
                catch (Error e)
                {
                    log(null, LogLevelFlags.LEVEL_ERROR, "Error Opening Character: %s\n", path);
                }
            }

            dialog.destroy();
        }

        private void save_character(string path)
        {
            string json = Json.gobject_to_data(this.character, null);
            var file = File.new_for_path(path);

            try
            {
                if (file.query_exists())
                {
                    file.delete();
                }

                FileOutputStream stream = file.create (FileCreateFlags.NONE);
                stream.write(json.data);
            }
            catch (Error e)
            {
                log(null, LogLevelFlags.LEVEL_ERROR, "Error Saving Character: %s\n", path);
            }
        }
    }
}
