namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ComboBoxRow.ui")]
    public class ComboBoxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;

        public ComboBoxRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}