namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillsPage.ui")]
    public class CharacterSkillsPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox strength;

        protected SpinButtonCheckboxRow strength_save;
        protected SpinButtonCheckboxRow athletics;

        public CharacterSkillsPage()
        {
            Object();

            this.setup_view();
        }

        private void setup_view()
        {
            this.strength_save = new SpinButtonCheckboxRow(_("Saving Throws"));
            this.athletics = new SpinButtonCheckboxRow(_("Athletics"));

            this.strength.add(strength_save);
            this.strength.add(athletics);
        }

        public void bind_character(ref CharacterSheet character)
        {

        }
    }
}