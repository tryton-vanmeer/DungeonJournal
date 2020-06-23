using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/StartupWindow.ui")]
    public class StartupWindow : Window
    {
        private DungeonJournal.ApplicationWindow window;

        [GtkChild] private Image logo;
        [GtkChild] private Box recents_box;
        [GtkChild] private ListBox recents_listbox;

        private bool done_startup { get; set; default=false; }

        public StartupWindow(DungeonJournal.ApplicationWindow window)
        {
            Object();
            this.window = window;

            this.logo.icon_name = Config.APP_ID;
            this.setup_recents();
        }

        public override void show_all()
        {
            base.show_all();

            if (this.recents_listbox.get_children().length() == 0)
            {
                this.recents_box.hide();
            }
        }

        private void setup_recents()
        {
            var recents = App.settings.recent_files;

            foreach (var file_path in recents)
            {
                this.recents_listbox.add(new Label(file_path));
            }
        }

        private void finish_startup()
        {
            this.done_startup = true;
            this.window.show_all();
            this.destroy();
        }

        [GtkCallback]
        private void on_open()
        {
            var res = this.window.on_open(this);

            if (res)
            {
                this.finish_startup();
            }
        }

        [GtkCallback]
        private void on_new()
        {
            this.finish_startup();
        }

        [GtkCallback]
        private void on_destroy()
        {
            if (!this.done_startup)
            {
                this.window.destroy();
            }
        }
    }
}