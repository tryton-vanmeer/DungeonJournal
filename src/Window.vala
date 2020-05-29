namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild] private Gtk.Stack stack;
        [GtkChild] private Hdy.Leaflet leaflet;
        [GtkChild] private Gtk.ListBox sidebar;

        private CharacterSheet character;
        private string character_path;

        private CharacterInfoView info_view;
        private CharacterBackgroundView background_view;
        private CharacterStatsView stats_view;
        private CharacterAbilitySkillView ability_skill_view;
        private CharacterFeaturesView features_view;

        public Window(Gtk.Application app)
        {
            Object(application: app);

            this.info_view = new CharacterInfoView();
            this.background_view = new CharacterBackgroundView();
            this.stats_view = new CharacterStatsView();
            this.ability_skill_view = new CharacterAbilitySkillView();
            this.features_view = new CharacterFeaturesView();

            this.character = new CharacterSheet();
            bind_character();

            this.character_path = null;

            set_help_overlay(new ShortcutsWindow());

            setup_style();
            setup_view();
		    connect_signals();
        }

        private void setup_style()
        {
            var provider = new Gtk.CssProvider();
            provider.load_from_resource("/io/github/trytonvanmeer/DungeonJournal/dungeonjournal.css");

            Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        private void setup_view()
        {
            this.stack.add_named(this.info_view, Page.INFO.to_string());
            this.stack.add_named(this.background_view, Page.BACKGROUND.to_string());
            this.stack.add_named(this.stats_view, Page.STATS.to_string());
            this.stack.add_named(this.ability_skill_view, Page.ABILITY_SKILLS.to_string());
            this.stack.add_named(this.features_view, Page.FEATURES.to_string());

            this.sidebar.insert(new Gtk.Label(Page.INFO.to_string()), Page.INFO.to_index());
            this.sidebar.insert(new Gtk.Label(Page.BACKGROUND.to_string()), Page.BACKGROUND.to_index());
            this.sidebar.insert(new Gtk.Label(Page.STATS.to_string()), Page.STATS.to_index());
            this.sidebar.insert(new Gtk.Label(Page.ABILITY_SKILLS.to_string()), Page.ABILITY_SKILLS.to_index());
            this.sidebar.insert(new Gtk.Label(Page.FEATURES.to_string()), Page.FEATURES.to_index());
        }

        private void connect_signals()
        {
            this.sidebar.row_activated.connect((row) =>
            {
                this.stack.set_visible_child_name(
                    Page.from_index(row.get_index()).to_string()
                );
                this.leaflet.set_visible_child(stack);
            });
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
            this.info_view.bind_character(ref this.character);
            this.background_view.bind_character(ref this.character);
            this.stats_view.bind_character(ref this.character);
            this.ability_skill_view.bind_character(ref this.character);
            this.features_view.bind_character(ref this.character);
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

    enum Page
    {
        INFO,
        BACKGROUND,
        STATS,
        ABILITY_SKILLS,
        FEATURES;

        public string to_string()
        {
            switch(this)
            {
                case INFO:
                    return _("Info");
                case BACKGROUND:
                    return _("Background");
                case STATS:
                    return _("Stats");
                case ABILITY_SKILLS:
                    return _("Ability & Skills");
                case FEATURES:
                    return _("Features");
                default:
                    assert_not_reached();
            }
        }

        public int to_index()
        {
            switch(this)
            {
                case INFO:
                    return 0;
                case BACKGROUND:
                    return 1;
                case STATS:
                    return 2;
                case ABILITY_SKILLS:
                    return 3;
                case FEATURES:
                    return 4;
                default:
                    assert_not_reached();
            }
        }

        public static Page from_index(int index)
        {
            switch(index)
            {
                case 0:
                    return INFO;
                case 1:
                    return BACKGROUND;
                case 2:
                    return STATS;
                case 3:
                    return ABILITY_SKILLS;
                case 4:
                    return FEATURES;
                default:
                    assert_not_reached();
            }
        }
    }
}
