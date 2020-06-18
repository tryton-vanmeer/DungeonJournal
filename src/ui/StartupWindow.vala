using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/StartupWindow.ui")]
    public class StartupWindow : Window
    {
        private DungeonJournal.ApplicationWindow window;

        public StartupWindow(DungeonJournal.ApplicationWindow window)
        {
            Object();
            this.window = window;
        }
    }
}