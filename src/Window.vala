namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        [GtkChild]
        Gtk.ListBox list_box;

        [GtkChild]
        Gtk.Stack stack;

        public Window(Gtk.Application app)
        {
            Object(application: app);

            setup_view();
		    connect_signals();
        }

        private void setup_view()
        {
            this.list_box.insert(new Gtk.Label("Info"), -1);
            this.list_box.insert(new Gtk.Label("Stats"), -1);

            this.stack.add_named(new CharacterInfoView(), "Info");
            this.stack.add_named(new CharacterStatsView(), "Stats");
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