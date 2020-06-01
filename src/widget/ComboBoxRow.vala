namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ComboBoxRow.ui")]
    public class ComboBoxRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] public Gtk.ComboBoxText combo;

        public ComboBoxRow(string label, string[] items)
        {
            Object();

            this.label.label = label;

            for (int i = 0; i < items.length; i++)
            {
                this.combo.append_text(items[i]);
            }
        }
    }
}