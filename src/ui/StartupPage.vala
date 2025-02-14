using Gtk;
using Adw;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/StartupPage.ui")]
    public class StartupPage : Box
    {
        private DungeonJournal.ApplicationWindow window;

        [GtkChild] private unowned StatusPage status_page;
        [GtkChild] private unowned Box recents_box;
        [GtkChild] private unowned ListBox recents_listbox;


        public StartupPage(DungeonJournal.ApplicationWindow window)
        {
            Object();
            this.window = window;

            this.status_page.icon_name = Config.APP_ID;
            this.setup_recents();
            this.hide_listbox_if_empty();
        }

        private void hide_listbox_if_empty()
        {
            if (this.recents_listbox.get_row_at_index(0) == null)
            {
                this.recents_box.hide();
            }
        }

        private void setup_recents()
        {
            var recents = App.settings.recent_files;

            foreach (var file_path in recents)
            {
                var row = new RecentsCharacterRow(file_path);
                this.recents_listbox.append(row);
            }
        }

        [GtkCallback]
        private async void on_open()
        {
            bool open = yield this.window.on_open();
            if (open)
            {
                this.window.switch();
            }
        }

        [GtkCallback]
        private void on_new()
        {
            this.window.switch();
        }

        [GtkCallback]
        private void on_recents_row_clicked(ListBoxRow row)
        {
            var recent_row = (RecentsCharacterRow) row;

            this.window.open_character(recent_row.file_path);
            this.window.switch();
        }

        [GtkCallback]
        private void on_recents_row_delete(ListBox listbox, ListBoxRow? row)
        {
            var recent_row = (RecentsCharacterRow) row;

            this.window.remove_recent_file(recent_row.file_path);

            this.recents_listbox.remove(row);
            this.hide_listbox_if_empty();
        }

        [GtkCallback]
        private void on_destroy()
        {
            this.window.destroy();
        }
    }
}
