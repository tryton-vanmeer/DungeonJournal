using Gtk;

namespace DungeonJournal
{
    public interface CharacterRowInterface : ListBoxRow
    {
        private const string[] icons = {"pan-end-symbolic", "pan-down-symbolic"};

        abstract Button expand_button { get; }
        abstract Image expand_image { get; }
        abstract Button delete_button { get; }
        abstract Box expand_box { get; }

        protected void expand_button_clicked()
        {
            this.expand_box.visible = !this.expand_box.visible;
            this.delete_button.visible = !this.delete_button.visible;
            this.expand_image.icon_name = icons[(int) this.expand_box.visible];
        }

        protected void delete_button_clicked()
        {

            var list_box = (ListBox) this.parent;
            list_box.row_activated(this);
        }

        public void collapse_row()
        {
            this.expand_button.clicked();
        }
    }
}