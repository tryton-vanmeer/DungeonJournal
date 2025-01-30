using Gtk;

namespace DungeonJournal
{
    public interface CharacterRowInterface : ListBoxRow
    {
        private const string[] icons = {"pan-end-symbolic", "pan-down-symbolic"};

        abstract Button delete_button { get; }

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
