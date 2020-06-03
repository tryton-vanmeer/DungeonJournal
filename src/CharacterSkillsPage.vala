namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillsPage.ui")]
    public class CharacterSkillsPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox strength;

        protected SpinButtonRow strength_score;
        protected SpinButtonCheckboxRow strength_save;
        protected SpinButtonCheckboxRow athletics;

        public CharacterSkillsPage()
        {
            Object();

            this.setup_view();
        }

        private void setup_view()
        {
            this.strength_score = new SpinButtonRow.with_ability_score_label();
            this.strength_save = new SpinButtonCheckboxRow(_("Saving Throws"));
            this.athletics = new SpinButtonCheckboxRow(_("Athletics"));

            this.strength.add(this.strength_score);
            this.strength.add(this.strength_save);
            this.strength.add(this.athletics);
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind("strength_score", this.strength_score.adjustment, "value");
            character.bind("strength_save_proficiency", this.strength_save.checkbox, "active");
            character.bind("strength_save", this.strength_save.adjustment, "value");

            character.bind("athletics_skill_proficiency", this.athletics.checkbox, "active");
            character.bind("athletics_skill", this.athletics.adjustment, "value");
        }
    }
}