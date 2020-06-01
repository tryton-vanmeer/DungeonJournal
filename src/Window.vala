namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/Window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild] private Gtk.Stack stack;

        private CharacterInfoPage page_info;

        private CharacterSheet character;
        private string character_path;

        public Window(Gtk.Application app)
        {
            Object(application: app);

            this.character = new CharacterSheet();
            bind_character();

            this.character_path = null;

            set_help_overlay(new ShortcutsWindow());

            setup_style();
            setup_view();
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

            this.stack.add_named(this.page_info, "info");
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
            var dialog = new Gtk.FileChooserNative(
                _("Save Character"),
                this,
                Gtk.FileChooserAction.SAVE,
                _("_Save"),
                _("_Cancel")
            );

            dialog.set_current_name(this.character.name + ".json");
            dialog.set_do_overwrite_confirmation(true);

            if (dialog.run() == Gtk.ResponseType.ACCEPT)
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
        }

        private void open_character()
        {
            var dialog = new Gtk.FileChooserNative(
                _("Open Character"),
                this,
                Gtk.FileChooserAction.OPEN,
                _("_Open"),
                _("_Cancel")
            );

            var filter = new Gtk.FileFilter();
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
