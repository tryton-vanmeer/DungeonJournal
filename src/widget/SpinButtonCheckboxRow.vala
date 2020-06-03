namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/SpinButtonCheckboxRow.ui")]
    public class SpinButtonCheckboxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] protected Gtk.Adjustment adjustment;
        [GtkChild] protected Gtk.CheckButton checkbox;

        public double value
        {
            get
            {
                return this.adjustment.value;
            }

            set
            {
                this.adjustment.set_value(value);
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
                this.checkbox.set_active(value);
            }
        }

        public SpinButtonCheckboxRow(string label)
        {
            Object();
            this.connect_signals();

            this.adjustment.set_lower(-5);

            this.label.label = label;
        }

        private void connect_signals()
        {
            this.adjustment.value_changed.connect(() => {
                this.notify_property("value");
            });

            this.checkbox.toggled.connect(() => {
                this.notify_property("active");
            });
        }
    }
}