namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillsPage.ui")]
    public class CharacterSkillsPage : Gtk.Box
    {
        public CharacterSkillsPage()
        {
            Object();

            this.setup_view();
        }

        private void setup_view()
        {

        }

        public void bind_character(ref CharacterSheet character)
        {

        }
    }
}