using Gee;

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

        protected HashMap<Ability, Gtk.ListBox> abilities;
        protected ArrayList<Gtk.ListBoxRow> skills;

        public CharacterSkillsPage()
        {
            Object();

            this.abilities = new HashMap<Ability, Gtk.ListBox>();

            this.abilities.set(Ability.STRENGTH, this.strength);
            this.abilities.set(Ability.DEXTERITY, this.dexterity);
            this.abilities.set(Ability.CONSTITUTION, this.constitution);
            this.abilities.set(Ability.INTELLIGENCE, this.intelligence);
            this.abilities.set(Ability.WISDOM, this.wisdom);
            this.abilities.set(Ability.CHARISMA, this.charisma);

            this.skills = new ArrayList<Gtk.ListBoxRow>();

            this.setup_view();
        }

        private void setup_view()
        {
            this.setup_view_abilities();
            this.setup_view_skills();
        }

        private void setup_view_abilities()
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

        private void setup_view_skills()
        {
            // strength
            this.add_skill_row(Ability.STRENGTH, "athletics", _("Athletics"));

            // dexterity
            this.add_skill_row(Ability.DEXTERITY, "acrobatics", _("Acrobatics"));
            this.add_skill_row(Ability.DEXTERITY, "sleight_of_hand", _("Sleight of Hand"));
            this.add_skill_row(Ability.DEXTERITY, "stealth", _("Stealth"));

            // intelligence
            this.add_skill_row(Ability.INTELLIGENCE, "arcana", _("Arcana"));
            this.add_skill_row(Ability.INTELLIGENCE, "history", _("History"));
            this.add_skill_row(Ability.INTELLIGENCE, "investigation", _("Investigation"));
            this.add_skill_row(Ability.INTELLIGENCE, "nature", _("Nature"));
            this.add_skill_row(Ability.INTELLIGENCE, "religion", _("Religion"));

            // wisdom
            this.add_skill_row(Ability.WISDOM, "animal_handling", _("Animal Handling"));
            this.add_skill_row(Ability.WISDOM, "insight", _("Insight"));
            this.add_skill_row(Ability.WISDOM, "medicine", _("Medicine"));
            this.add_skill_row(Ability.WISDOM, "perception", _("Perception"));
            this.add_skill_row(Ability.WISDOM, "survival", _("Survival"));

            // charisma
            this.add_skill_row(Ability.CHARISMA, "deception", _("Deception"));
            this.add_skill_row(Ability.CHARISMA, "intimidation", _("Intimidation"));
            this.add_skill_row(Ability.CHARISMA, "performance", _("Performance"));
            this.add_skill_row(Ability.CHARISMA, "persuasion", _("Persuasion"));
        }

        private void add_skill_row(Ability ability, string skill, string label)
        {
            var skill_row = new SpinButtonCheckboxRow(label);
            skill_row.set_name(skill);

            this.abilities.get(ability).add(skill_row);
            this.skills.add(skill_row);
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

            foreach (Gtk.ListBoxRow row in this.skills)
            {
                var name = row.get_name();

                character.bind(@"$(name)_skill_proficiency", row, "active");
                character.bind(@"$(name)_skill", row, "value");
            }
        }
    }
}