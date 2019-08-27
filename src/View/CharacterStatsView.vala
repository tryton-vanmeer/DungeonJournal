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

        public CharacterStatsView()
        {
            connect_signals();
        }

        private void connect_signals()
        {

        }
    }
}