using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterAttackRow.ui")]
    public class CharacterAttackRow: ListBoxRow
    {
        [GtkChild] protected Label name_label;
        [GtkChild] protected Button expand_button;
        [GtkChild] protected Button delete_button;
        [GtkChild] protected Image expand_image;
        [GtkChild] protected Box expand_box;

        [GtkChild] protected Entry weapon_entry;
        [GtkChild] protected Entry range_entry;
        [GtkChild] protected Entry atkbonus_entry;
        [GtkChild] protected Entry damage_entry;

        public CharacterAttack attack { get; set; }

        public CharacterAttackRow(ref CharacterAttack attack)
        {
            Object();

            this.attack = attack;

            this.attack.bind_property("weapon", this.weapon_entry, "text", Util.BINDING_FLAGS);
            this.attack.bind_property("range", this.range_entry, "text", Util.BINDING_FLAGS);
            this.attack.bind_property("atkbonus", this.atkbonus_entry, "text", Util.BINDING_FLAGS);
            this.attack.bind_property("damage", this.damage_entry, "text", Util.BINDING_FLAGS);
        }
    }
}