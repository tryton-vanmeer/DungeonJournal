namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillsPage.ui")]
    public class CharacterSkillsPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox strength;
        [GtkChild] protected Gtk.ListBox dexterity;
        [GtkChild] protected Gtk.ListBox constitution;
        [GtkChild] protected Gtk.ListBox intelligence;
        [GtkChild] protected Gtk.ListBox wisdom;
        [GtkChild] protected Gtk.ListBox charisma;

        protected SpinButtonRow strength_score;
        protected SpinButtonCheckboxRow strength_save;

        protected SpinButtonRow dexterity_score;
        protected SpinButtonCheckboxRow dexterity_save;

        protected SpinButtonRow constitution_score;
        protected SpinButtonCheckboxRow constitution_save;

        protected SpinButtonRow intelligence_score;
        protected SpinButtonCheckboxRow intelligence_save;

        protected SpinButtonRow wisdom_score;
        protected SpinButtonCheckboxRow wisdom_save;

        protected SpinButtonRow charisma_score;
        protected SpinButtonCheckboxRow charisma_save;

        public CharacterSkillsPage()
        {
            Object();

            this.setup_view();
        }

        private void setup_view()
        {
            this.strength_score = new SpinButtonRow.with_ability_score_label();
            this.strength_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.strength.add(this.strength_score);
            this.strength.add(this.strength_save);

            this.dexterity_score = new SpinButtonRow.with_ability_score_label();
            this.dexterity_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.dexterity.add(this.dexterity_score);
            this.dexterity.add(this.dexterity_save);

            this.constitution_score = new SpinButtonRow.with_ability_score_label();
            this.constitution_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.constitution.add(this.constitution_score);
            this.constitution.add(this.constitution_save);

            this.intelligence_score = new SpinButtonRow.with_ability_score_label();
            this.intelligence_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.intelligence.add(this.intelligence_score);
            this.intelligence.add(this.intelligence_save);

            this.wisdom_score = new SpinButtonRow.with_ability_score_label();
            this.wisdom_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.wisdom.add(this.wisdom_score);
            this.wisdom.add(this.wisdom_save);

            this.charisma_score = new SpinButtonRow.with_ability_score_label();
            this.charisma_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.charisma.add(this.charisma_score);
            this.charisma.add(this.charisma_save);
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind("strength_score", this.strength_score, "value");
            character.bind("strength_save_proficiency", this.strength_save, "active");
            character.bind("strength_save", this.strength_save, "value");

            character.bind("dexterity_score", this.dexterity_score, "value");
            character.bind("dexterity_save_proficiency", this.dexterity_save, "active");
            character.bind("dexterity_save", this.dexterity_save, "value");

            character.bind("constitution_score", this.constitution_score, "value");
            character.bind("constitution_save_proficiency", this.constitution_save, "active");
            character.bind("constitution_save", this.constitution_save, "value");

            character.bind("intelligence_score", this.intelligence_score, "value");
            character.bind("intelligence_save_proficiency", this.intelligence_save, "active");
            character.bind("intelligence_save", this.intelligence_save, "value");

            character.bind("wisdom_score", this.wisdom_score, "value");
            character.bind("wisdom_save_proficiency", this.wisdom_save, "active");
            character.bind("wisdom_save", this.wisdom_save, "value");

            character.bind("charisma_score", this.charisma_score, "value");
            character.bind("charisma_save_proficiency", this.charisma_save, "active");
            character.bind("charisma_save", this.charisma_save, "value");
        }
    }
}