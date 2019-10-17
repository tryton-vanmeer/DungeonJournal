namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/background.ui")]
    public class CharacterBackgroundView : CharacterView
    {
        [GtkChild] private CharacterEntry background_character_entry;
        [GtkChild] private CharacterEntry personality_traits_character_entry;
        [GtkChild] private CharacterEntry ideals_character_entry;
        [GtkChild] private CharacterEntry bonds_character_entry;
        [GtkChild] private CharacterEntry flaws_character_entry;

        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("background", this.background_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("personality_traits", this.personality_traits_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("ideals", this.ideals_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("bonds", this.bonds_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("flaws", this.flaws_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}