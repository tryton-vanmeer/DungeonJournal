using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/EntryRow.ui")]
    public class EntryRow: ListBoxRow
    {
        [GtkChild] protected unowned Label label;
        [GtkChild] protected unowned Entry entry;

        public string text
        {
            get
            {
                return this.entry.text;
            }

            set
            {
                this.entry.text = value;
            }
        }

        public EntryRow(string label)
        {
            Object();
            this.connect_signals();

            this.label.label = label;
        }

        private void connect_signals()
        {
            this.entry.changed.connect(() => {
                this.notify_property("text");
            });
        }
    }
}
