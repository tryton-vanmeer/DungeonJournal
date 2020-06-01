namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ComboBoxRow.ui")]
    public class ComboBoxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] protected Gtk.ComboBoxText combo;

        public ComboBoxRow(string label)
        {
            Object();

            this.label.label = label;
        }
    }
}