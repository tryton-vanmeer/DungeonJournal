using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ComboBoxRow.ui")]
    public class ComboBoxRow: ListBoxRow
    {
        [GtkChild] protected unowned Label label;
        [GtkChild] protected unowned DropDown combo;

        public int active
        {
            get
            {
                return (int)this.combo.selected;
            }

            set
            {
                this.combo.selected = value;
            }
        }

        public ComboBoxRow(string label, string[] items)
        {
            Object();
            this.connect_signals();

            this.label.label = label;
            StringList list = new StringList(items);
            this.combo.model = list;
        }

        private void selected_changed() {
            this.notify_property("active");
        }

        private void connect_signals()
        {
            /*
            this.combo.scroll_event.connect(() => {
                Signal.stop_emission_by_name(this.combo, "scroll-event");
                return false;
            });
            */

            this.combo.connect("notify::selected", this.selected_changed);
        }
    }
}
