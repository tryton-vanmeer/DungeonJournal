namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow
    {
        public Window(Gtk.Application app)
        {
            Object(application: app);

            setup_view();
		    connect_signals();
        }
    }

    private void setup_view()
    {

    }

    private void connect_signals()
    {

    }
}