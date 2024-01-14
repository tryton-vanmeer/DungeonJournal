using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected unowned Label name_label;
        [GtkChild] protected unowned Label quantity_label;
        [GtkChild] protected unowned Button expand_button { get; }
        [GtkChild] protected unowned Button delete_button { get; }
        [GtkChild] protected unowned Image expand_image { get; }
        [GtkChild] protected unowned Box expand_box { get; }

        [GtkChild] protected unowned Entry name_entry;
        [GtkChild] protected unowned SpinButton quantity_spinbutton;
        [GtkChild] protected unowned Adjustment quantity_adjustment;
        [GtkChild] protected unowned Entry cost_entry;
        [GtkChild] protected unowned SpinButton weight_spinbutton;
        [GtkChild] protected unowned Adjustment weight_adjustment;
        [GtkChild] protected unowned TextView description_entry;

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

            this.name_entry.bind_property("text", this.name_label, "label", BindingFlags.SYNC_CREATE);
            this.quantity_adjustment.bind_property(
                "value", this.quantity_label, "label", BindingFlags.SYNC_CREATE,
                (binding, srcval, ref targetval) => {
                    double src = (double) srcval;
                    targetval.set_string(@"x$((int) src)");
                    return true;
                }
            );
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
        {/*
            this.quantity_spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.quantity_spinbutton, "scroll-event");
                return false;
            });

            this.weight_spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.weight_spinbutton, "scroll-event");
                return false;
            });
        */
       }
    }
}
