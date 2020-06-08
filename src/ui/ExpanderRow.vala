using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ExpanderRow.ui")]
    public class ExpanderRow : Box
    {
        [GtkChild] protected Button expand_button;
        [GtkChild] protected Button delete_button;

        public ExpanderRow()
        {
            Object();
        }
    }
}