using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterAttackRow.ui")]
    public class CharacterAttackRow: Adw.ExpanderRow, CharacterRowInterface
    {
        [GtkChild] protected unowned Button delete_button { get; }

        [GtkChild] protected unowned Adw.EntryRow weapon_entry;
        [GtkChild] protected unowned Adw.EntryRow range_entry;
        [GtkChild] protected unowned Adw.EntryRow atkbonus_entry;
        [GtkChild] protected unowned Adw.EntryRow damage_entry;

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

        [GtkCallback]
        private void update_title()
        {
            this.title = this.weapon_entry.text;
            this.subtitle = this.damage_entry.text + " | " + this.atkbonus_entry.text;
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }
    }
}
