using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : ListBoxRow
    {
        [GtkChild] protected Entry name_entry;
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
        }

        private void connect_signals()
        {
            this.weight_spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.weight_spinbutton, "scroll-event");
                return false;
            });
        }
    }
}