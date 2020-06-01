namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox info;

        protected EntryRow info_name;
        protected EntryRow info_class;
        protected EntryRow info_race;

        public CharacterInfoPage()
        {
            Object();

            setup_view();
        }

        private void setup_view()
        {
            info_name = new EntryRow(_("Character Name"));
            info_class = new EntryRow(_("Class"));
            info_race = new EntryRow(_("Race"));

            info.add(info_name);
            info.add(info_class);
            info.add(info_race);
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("name", this.info_name.entry, "text", BINDING_FLAGS);
            character.bind_property("class", this.info_class.entry, "text", BINDING_FLAGS);
            character.bind_property("race", this.info_class.entry, "text", BINDING_FLAGS);
        }
    }
}