using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterAttackRow.ui")]
    public class CharacterAttackRow: ListBoxRow
    {
        [GtkChild] protected Entry weapon_entry;
        [GtkChild] protected Entry type_entry;
        [GtkChild] protected Entry range_entry;
        [GtkChild] protected Entry atkbonus_entry;
        [GtkChild] protected Entry damage_entry;

        public CharacterAttackRow()
        {
            Object();
        }
    }
}