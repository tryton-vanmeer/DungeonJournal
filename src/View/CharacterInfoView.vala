namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/info.ui")]
    public class CharacterInfoView : Gtk.Bin
    {
        [GtkChild]
        private CharacterEntry name_character_entry;

        [GtkChild]
        private CharacterEntry class_character_entry;

        [GtkChild]
        private CharacterEntry race_character_entry;

        [GtkChild]
        private Gtk.ComboBoxText alignment_character_entry;

        [GtkChild]
        private CharacterEntry level_character_entry;

        [GtkChild]
        private CharacterEntry xp_character_entry;
    }
}