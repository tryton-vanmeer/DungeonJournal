namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild]
        private Gtk.Stack stack;

        [GtkChild]
        private Hdy.Leaflet leaflet;

        [GtkChild]
        private Gtk.ListBox sidebar;

        private CharacterInfoView info_view;
        private CharacterStatsView stats_view;
        private CharacterAbilitySkillView ability_skill_view;

        public Window(Gtk.Application app)
        {
            Object(application: app);

            this.info_view = new CharacterInfoView();
            this.stats_view = new CharacterStatsView();
            this.ability_skill_view = new CharacterAbilitySkillView();

            setup_view();
		    connect_signals();
        }

        private void setup_view()
        {
            this.stack.add_named(this.info_view, Page.INFO.to_string());
            this.stack.add_named(this.stats_view, Page.STATS.to_string());
            this.stack.add_named(this.ability_skill_view, Page.ABILITY_SKILLS.to_string());

            this.sidebar.insert(new Gtk.Label(Page.INFO.to_string()), Page.INFO.to_index());
            this.sidebar.insert(new Gtk.Label(Page.STATS.to_string()), Page.STATS.to_index());
            this.sidebar.insert(new Gtk.Label(Page.ABILITY_SKILLS.to_string()), Page.ABILITY_SKILLS.to_index());
        }

        private void connect_signals()
        {
            sidebar.row_activated.connect((row) =>
            {
                this.stack.set_visible_child_name(
                    Page.from_index(row.get_index()).to_string()
                );
                this.leaflet.set_visible_child(stack);
            });
        }
    }

    enum Page
    {
        INFO,
        STATS,
        ABILITY_SKILLS;

        public string to_string()
        {
            switch(this)
            {
                case INFO:
                    return _("Info");
                case STATS:
                    return _("Stats");
                case ABILITY_SKILLS:
                    return _("Ability & Skills");
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
                case STATS:
                    return 1;
                case ABILITY_SKILLS:
                    return 2;
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
                    return STATS;
                case 2:
                    return ABILITY_SKILLS;
                default:
                    assert_not_reached();
            }
        }
    } 
}