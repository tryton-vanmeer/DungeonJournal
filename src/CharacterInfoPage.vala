namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox info;

        protected EntryRow info_name;

        public CharacterInfoPage()
        {
            Object();

            setup_view();
        }

        private void setup_view()
        {
            info_name = new EntryRow(_("Character Name"));

            info.add(info_name);
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("name", this.info_name.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("name", this.name_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("class", this.class_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("race", this.race_character_entry.entry, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("alignment", this.alignment_character_entry, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("level", this.level_character_entry.adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            //  character.bind_property("xp", this.xp_character_entry.adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}