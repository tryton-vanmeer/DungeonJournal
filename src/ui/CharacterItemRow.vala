using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected Label name_label;
        [GtkChild] protected Button expand_button { get; }
        [GtkChild] protected Button delete_button { get; }
        [GtkChild] protected Image expand_image { get; }
        [GtkChild] protected Box expand_box { get; }

        [GtkChild] protected Entry name_entry;
        [GtkChild] protected SpinButton quantity_spinbutton;
        [GtkChild] protected Adjustment quantity_adjustment;
        [GtkChild] protected Entry cost_entry;
        [GtkChild] protected SpinButton weight_spinbutton;
        [GtkChild] protected Adjustment weight_adjustment;
        [GtkChild] protected TextView description_entry;

        public CharacterItem item { get; set; }

        public CharacterItemRow(ref CharacterItem item)
        {
            Object();
            this.connect_signals();

            this.item = item;

            this.item.bind_property("item_name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.item.bind_property("quantity", this.quantity_adjustment, "value", Util.BINDING_FLAGS);
            this.item.bind_property("cost", this.cost_entry, "text", Util.BINDING_FLAGS);
            this.item.bind_property("weight", this.weight_adjustment, "value", Util.BINDING_FLAGS);
            this.item.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);

            this.name_label.bind_property("label", this.name_entry, "text", Util.BINDING_FLAGS);
        }

        [GtkCallback]
        private void on_expand_button_clicked()
        {
            this.expand_button_clicked();
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }

        private void connect_signals()
        {
            this.quantity_spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.quantity_spinbutton, "scroll-event");
                return false;
            });

            this.weight_spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.weight_spinbutton, "scroll-event");
                return false;
            });
        }
    }
}