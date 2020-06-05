using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/EntryRow.ui")]
    public class EntryRow: ListBoxRow
    {
        [GtkChild] protected Label label;
        [GtkChild] protected Entry entry;

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