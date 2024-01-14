using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/RecentsCharacterRow.ui")]
    public class RecentsCharacterRow: Adw.ActionRow
    {
        public string file_path
        {
            get
            {
                return this.subtitle;
            }
        }

        public RecentsCharacterRow(string file_path)
        {
            Object();
            this.subtitle = file_path;
            this.title = Path.get_basename(file_path).replace(".json", "");
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            var list_box = (ListBox) this.parent;
            list_box.row_selected(this);
        }
    }
}
