namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/EntryRow.ui")]
    public class EntryRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] public Gtk.Entry entry { get; }

        public EntryRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}