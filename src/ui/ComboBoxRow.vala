using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ComboBoxRow.ui")]
    public class ComboBoxRow: ListBoxRow
    {
        [GtkChild] protected Label label;
        [GtkChild] protected ComboBoxText combo;

        public int active
        {
            get
            {
                return this.combo.active;
            }

            set
            {
                this.combo.active = value;
            }
        }

        public ComboBoxRow(string label, string[] items)
        {
            Object();
            this.connect_signals();

            this.label.label = label;

            for (int i = 0; i < items.length; i++)
            {
                this.combo.append_text(items[i]);
            }
        }

        private void connect_signals()
        {
            this.combo.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.combo, "scroll-event");
                return false;
            });

            this.combo.changed.connect(() => {
                this.notify_property("active");
            });
        }
    }
}