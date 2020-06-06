using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : ListBoxRow
    {
        public CharacterItem item { get; set; }

        public CharacterItemRow(ref CharacterItem item)
        {
            Object();

            this.item = item;
        }
    }
}