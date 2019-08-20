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
            var label = new Gtk.Label("Info");
            this.list_box.insert(label, -1);
        }

        private void connect_signals()
        {

        }
    }
}