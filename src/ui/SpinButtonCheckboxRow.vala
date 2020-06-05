using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/SpinButtonCheckboxRow.ui")]
    public class SpinButtonCheckboxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Label label;
        [GtkChild] protected SpinButton spinbutton;
        [GtkChild] protected Adjustment adjustment;
        [GtkChild] protected CheckButton checkbox;

        public double value
        {
            get
            {
                return this.adjustment.value;
            }

            set
            {
                this.adjustment.value = value;
            }
        }

        public bool active
        {
            get
            {
                return this.checkbox.active;
            }

            set
            {
                this.checkbox.active = value;
            }
        }

        public SpinButtonCheckboxRow(string label)
        {
            Object();
            this.connect_signals();

            this.adjustment.lower = -5;

            this.label.label = label;
        }

        private void connect_signals()
        {
            this.spinbutton.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.spinbutton, "scroll-event");
                return false;
            });

            this.adjustment.value_changed.connect(() => {
                this.notify_property("value");
            });

            this.checkbox.toggled.connect(() => {
                this.notify_property("active");
            });
        }
    }
}