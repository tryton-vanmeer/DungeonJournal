using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/RecentsCharacterRow.ui")]
    public class RecentsCharacterRow: ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected Label name_label;
        [GtkChild] protected Label filepath_label;
        [GtkChild] protected Button expand_button { get; }
        [GtkChild] protected Button delete_button { get; }
        [GtkChild] protected Image expand_image { get; }
        [GtkChild] protected Box expand_box { get; }

        public string file_path
        {
            get
            {
                return this.filepath_label.label;
            }
        }

        public RecentsCharacterRow(string file_path)
        {
            Object();
            this.filepath_label.label = file_path;
            this.name_label.label = Path.get_basename(file_path).replace(".json", "");
        }

        public override void show_all()
        {
            base.show_all();
            this.collapse_row();
        }

        [GtkCallback]
        private void on_expand_button_clicked()
        {
            this.expand_button_clicked();
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            var list_box = (ListBox) this.parent;
            list_box.row_selected(this);
        }
    }
}