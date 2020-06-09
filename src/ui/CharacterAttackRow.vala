using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterAttackRow.ui")]
    public class CharacterAttackRow: ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected Label name_label;
        [GtkChild] protected Label atkbonus_label;
        [GtkChild] protected Label damage_label;
        [GtkChild] protected Button expand_button { get; }
        [GtkChild] protected Button delete_button { get; }
        [GtkChild] protected Image expand_image { get; }
        [GtkChild] protected Box expand_box { get; }

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

            this.weapon_entry.bind_property("text", this.name_label, "label", BindingFlags.SYNC_CREATE);
            this.atkbonus_entry.bind_property("text", this.atkbonus_label, "label", BindingFlags.SYNC_CREATE);
            this.damage_entry.bind_property("text", this.damage_label, "label", BindingFlags.SYNC_CREATE);
        }

        [GtkCallback]
        private void on_expand_button_clicked()
        {
            this.expand_button_clicked();
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }
    }
}