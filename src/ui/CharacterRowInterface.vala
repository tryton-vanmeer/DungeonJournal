using Gtk;

namespace DungeonJournal
{
    public interface CharacterRowInterface : ListBoxRow
    {
        protected void delete_button_clicked()
        {
            var list_box = (ListBox) this.parent;
            list_box.row_activated(this);
        }

        public void collapse_row()
        {
            print("TODO");
        }
    }
}
