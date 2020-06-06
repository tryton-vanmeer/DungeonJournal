using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterItemRow.ui")]
    public class CharacterItemRow : ListBoxRow
    {
        [GtkChild] protected Entry name_entry;
        [GtkChild] protected Entry cost_entry;
        [GtkChild] protected Adjustment weight_adjustment;
        [GtkChild] protected TextView description_entry;

        public CharacterItem item { get; set; }

        public CharacterItemRow(ref CharacterItem item)
        {
            Object();

            this.item = item;
        }
    }
}