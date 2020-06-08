using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/ExpanderRow.ui")]
    public class ExpanderRow : Box
    {
        [GtkChild] protected Button expand_button { get; set; }
        [GtkChild] protected Button delete_button { get; set; }

        public ExpanderRow()
        {
            Object();
        }
    }
}