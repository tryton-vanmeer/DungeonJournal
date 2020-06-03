namespace DungeonJournal
{
    public class SeparatorRow: Gtk.ListBoxRow
    {
        Gtk.Separator separator;

        public SeparatorRow()
        {
            Object();

            this.set_activatable(false);

            this.separator = new Gtk.Separator(Gtk.Orientation.HORIZONTAL);
            this.add(separator);
            this.show_all();
        }
    }
}