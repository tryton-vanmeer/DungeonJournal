using Gtk;

namespace DungeonJournal
{
    public class EntryRow: Adw.EntryRow
    {
        public EntryRow(string label)
        {
            Object();
            this.title = label;
        }
    }
}
