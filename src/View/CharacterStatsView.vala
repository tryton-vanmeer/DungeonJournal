namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/stats.ui")]
    public class CharacterStatsView : Gtk.Bin
    {
        [GtkChild]
        private CharacterEntry proficiency_bonus_character_entry;

        [GtkChild]
        private CharacterEntry ac_character_entry;

        [GtkChild]
        private CharacterEntry initiative_character_entry;

        [GtkChild]
        private CharacterEntry speed_character_entry;

        [GtkChild]
        private CharacterEntry hp_max_character_entry;

        [GtkChild]
        private Gtk.Adjustment hp_adjustment;

        [GtkChild]
        private CharacterEntry hit_dicecharacter_entry;

        public CharacterStatsView()
        {
            connect_signals();
        }

        private void connect_signals()
        {

        }
    }
}