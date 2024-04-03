using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : Adw.ExpanderRow, CharacterRowInterface
    {
        [GtkChild] protected unowned Button delete_button { get; }

        [GtkChild] protected unowned Adw.EntryRow name_entry;
        [GtkChild] protected unowned Adw.SpinRow quantity_spinbutton;
        [GtkChild] protected unowned Adjustment quantity_adjustment;
        [GtkChild] protected unowned Adw.EntryRow cost_entry;
        [GtkChild] protected unowned Adw.SpinRow weight_spinbutton;
        [GtkChild] protected unowned Adjustment weight_adjustment;
        [GtkChild] protected unowned TextView description_entry;

        public CharacterItem item { get; set; }

        public CharacterItemRow(ref CharacterItem item)
        {
            Object();

            this.item = item;

            this.item.bind_property("item_name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.item.bind_property("quantity", this.quantity_adjustment, "value", Util.BINDING_FLAGS);
            this.item.bind_property("cost", this.cost_entry, "text", Util.BINDING_FLAGS);
            this.item.bind_property("weight", this.weight_adjustment, "value", Util.BINDING_FLAGS);
            this.item.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);
        }

        [GtkCallback]
        private void update_title()
        {
            this.title = this.name_entry.text;
            this.subtitle = "x" + this.quantity_spinbutton.value.to_string();
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }
    }
}
