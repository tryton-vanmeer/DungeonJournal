namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild]
        private Gtk.ListBox list_box;

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
            this.list_box.insert(new Gtk.Label("Info"), -1);
            this.list_box.insert(new Gtk.Label("Stats"), -1);

            this.stack.add_named(this.info_view, "Info");
            this.stack.add_named(this.stats_view, "Stats");
        }

        private void connect_signals()
        {
            this.list_box.row_activated.connect((row) =>
            {
                var label = (Gtk.Label) row.get_child();
                this.stack.set_visible_child_name(label.label);
            });
        }
    }
}