using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterExpandingRow.ui")]
    public class CharacterExpandingRow : ListBoxRow
    {
        [GtkChild] protected Box expander_box;
        [GtkChild] protected Button delete_button;

        public CharacterExpandingRow()
        {
            Object();
        }
    }
}