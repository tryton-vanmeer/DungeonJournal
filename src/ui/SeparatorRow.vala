using Gtk;

namespace DungeonJournal
{
    public class SeparatorRow: ListBoxRow
    {
        Separator separator;

        public SeparatorRow()
        {
            Object();

            this.set_activatable(false);
            this.set_can_focus(false);

            this.separator = new Separator(Orientation.HORIZONTAL);
            this.add(separator);
            this.show_all();
        }
    }
}