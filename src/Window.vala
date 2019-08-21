namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild]
        private Gtk.Stack stack;

        private CharacterInfoView info_view;
        private CharacterStatsView stats_view;

        public Window(Gtk.Application app)
        {
            Object(application: app);

            this.info_view = new CharacterInfoView();
            this.stats_view = new CharacterStatsView();

            setup_view();
		    connect_signals();
        }

        private void setup_view()
        {
            this.stack.add_titled(this.info_view, "info", _("Info"));
            this.stack.add_titled(this.stats_view, "stats", _("Stats"));
        }

        private void connect_signals()
        {

        }
    }
}