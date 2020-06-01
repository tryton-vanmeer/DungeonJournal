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
            character.bind_property("name", this.info_name.entry, "text", BINDING_FLAGS);
        }
    }
}