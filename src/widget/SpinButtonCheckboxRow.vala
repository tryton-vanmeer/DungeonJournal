namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/SpinButtonCheckboxRow.ui")]
    public class SpinButtonCheckboxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] public Gtk.Adjustment adjustment;
        [GtkChild] public Gtk.CheckButton checkbox;

        public SpinButtonCheckboxRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}