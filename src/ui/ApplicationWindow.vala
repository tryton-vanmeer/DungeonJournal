using Gtk;
using Gee;
using Adw;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ApplicationWindow.ui")]
    public class ApplicationWindow : Gtk.ApplicationWindow
    {
        [GtkChild] private unowned ViewStack stack;

        private CharacterInfoPage page_info;
        private CharacterSkillsPage page_skills;
        private CharacterInventoryPage page_inventory;

        private StartupWindow startup_window;

        private CharacterSheet character;
        private string character_path;

        public ApplicationWindow(Gtk.Application app)
        {
            Object(application: app);

            this.character = new CharacterSheet();
            this.character_path = null;

            Builder builder = new Builder.from_resource("/io/github/trytonvanmeer/DungeonJournal/ui/ShortcutsWindow.ui");
            set_help_overlay(builder.get_object("shortcuts_window") as Gtk.ShortcutsWindow);

            setup_view();
            bind_character();

            startup_window = new StartupWindow(this);
            startup_window.present();
        }

        private void setup_view()
        {
            this.page_info = new CharacterInfoPage();
            this.page_skills = new CharacterSkillsPage();
            this.page_inventory = new CharacterInventoryPage();

            this.stack.add_titled_with_icon(this.page_info, "info", _("Info"), "dialog-information");
            this.stack.add_titled_with_icon(this.page_skills, "skills", _("Skills"), "software-update-available");
            this.stack.add_titled_with_icon(this.page_inventory, "inventory", _("Inventory"), "emoji-symbols");
        }

        private void bind_character()
        {
            this.page_info.bind_character(this.character);
            this.page_skills.bind_character(this.character);
            this.page_inventory.bind_character(this.character);
        }

        public async bool on_open(Gtk.Window? parent=this)
        {
            try {
                var dialog = new FileDialog();
                var filter = new FileFilter();
                filter.add_mime_type("application/json");
                dialog.set_default_filter(filter);
                dialog.set_title("Open Character");
                var file = yield dialog.open(parent, null);
                string path = file.get_path();
                this.open_character(path);
                return true;
            } catch (GLib.Error e) {
                stdout.printf("Error: %s\n", e.message);
                return false;
            }
        }

        public void on_save()
        {
            if (this.character_path == null)
            {
                this.on_save_as.begin();
            }
            else
            {
                this.save_character(this.character_path);
            }
        }

        public async void on_save_as()
        {
            try {
                var dialog = new FileDialog();
                dialog.set_initial_name(this.character.name + ".json");
                var file = yield dialog.save(this, null);
                string path = file.get_path();
                this.save_character(path);
            } catch (GLib.Error e) {
                stdout.printf("Error: %s\n", e.message);
            }
        }

        public void open_character(string file_path)
        {
            try
            {
                var parser = new Json.Parser();
                parser.load_from_file(file_path);
                Json.Node node = parser.get_root();
                this.character = Json.gobject_deserialize(typeof (CharacterSheet), node) as CharacterSheet;
                this.bind_character();
                this.add_recent_file(file_path);
                this.character_path = file_path;
            }
            catch (Error e)
            {
                log(null, LogLevelFlags.LEVEL_ERROR, "Error Opening Character: %s\n", file_path);
            }
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

                FileOutputStream stream = file.create(FileCreateFlags.NONE);
                stream.write(json.data);
            }
            catch (Error e)
            {
                log(null, LogLevelFlags.LEVEL_ERROR, "Error Saving Character: %s\n", path);
            }
        }

        private void add_recent_file(string file_path)
        {
            var recents = new ArrayList<string>.wrap(App.settings.recent_files);

            if (!recents.contains(file_path))
            {
                recents.add(file_path);
                App.settings.recent_files = recents.to_array();
            }
        }

        public void remove_recent_file(string file_path)
        {
            var recents = new ArrayList<string>.wrap(App.settings.recent_files);

            recents.remove(file_path);
            App.settings.recent_files = recents.to_array();
        }
    }
}
