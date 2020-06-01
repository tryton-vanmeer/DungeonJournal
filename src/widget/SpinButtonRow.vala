namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/SpinButtonRow.ui")]
    public class SpinButtonRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] public Gtk.Adjustment adjustment;

        public SpinButtonRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}