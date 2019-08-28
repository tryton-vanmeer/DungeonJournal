namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/stats.ui")]
    public class CharacterStatsView : Gtk.Bin
    {
        [GtkChild]
        private CharacterEntry proficiency_bonus_character_entry;

        [GtkChild]
        private CharacterEntry armor_class_character_entry;

        [GtkChild]
        private CharacterEntry initiative_character_entry;

        [GtkChild]
        private CharacterEntry speed_character_entry;

        [GtkChild]
        private CharacterEntry hp_max_character_entry;

        [GtkChild]
        private Gtk.Adjustment hp_adjustment;

        [GtkChild]
        private CharacterEntry hit_dice_character_entry;
        
        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("proficiency_bonus", this.proficiency_bonus_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("armor_class", this.armor_class_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("initiative", this.initiative_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("speed", this.speed_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("hp_max", this.hp_max_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("hp_current", this.hp_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("hit_dice", this.hit_dice_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}