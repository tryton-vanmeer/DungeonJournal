namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/EntryRow.ui")]
    public class EntryRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;

        public EntryRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}