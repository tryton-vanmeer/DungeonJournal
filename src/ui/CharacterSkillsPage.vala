using Gtk;
using Gee;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillsPage.ui")]
    public class CharacterSkillsPage : Box
    {
        [GtkChild] protected ListBox strength_listbox;
        [GtkChild] protected ListBox dexterity_listbox;
        [GtkChild] protected ListBox constitution_listbox;
        [GtkChild] protected ListBox intelligence_listbox;
        [GtkChild] protected ListBox wisdom_listbox;
        [GtkChild] protected ListBox charisma_listbox;

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

        protected HashMap<Ability, ListBox> abilities;
        protected ArrayList<ListBoxRow> skills;

        public CharacterSkillsPage()
        {
            Object();

            this.abilities = new HashMap<Ability, ListBox>();

            this.abilities.set(Ability.STRENGTH, this.strength_listbox);
            this.abilities.set(Ability.DEXTERITY, this.dexterity_listbox);
            this.abilities.set(Ability.CONSTITUTION, this.constitution_listbox);
            this.abilities.set(Ability.INTELLIGENCE, this.intelligence_listbox);
            this.abilities.set(Ability.WISDOM, this.wisdom_listbox);
            this.abilities.set(Ability.CHARISMA, this.charisma_listbox);

            this.skills = new ArrayList<ListBoxRow>();

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

            this.strength_listbox.add(this.strength_score);
            this.strength_listbox.add(new SeparatorRow());
            this.strength_listbox.add(this.strength_save);
            this.strength_listbox.add(new SeparatorRow());

            this.dexterity_score = new SpinButtonRow.with_ability_score_label();
            this.dexterity_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.dexterity_listbox.add(this.dexterity_score);
            this.dexterity_listbox.add(new SeparatorRow());
            this.dexterity_listbox.add(this.dexterity_save);
            this.dexterity_listbox.add(new SeparatorRow());

            this.constitution_score = new SpinButtonRow.with_ability_score_label();
            this.constitution_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.constitution_listbox.add(this.constitution_score);
            this.constitution_listbox.add(new SeparatorRow());
            this.constitution_listbox.add(this.constitution_save);

            this.intelligence_score = new SpinButtonRow.with_ability_score_label();
            this.intelligence_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.intelligence_listbox.add(this.intelligence_score);
            this.intelligence_listbox.add(new SeparatorRow());
            this.intelligence_listbox.add(this.intelligence_save);
            this.intelligence_listbox.add(new SeparatorRow());

            this.wisdom_score = new SpinButtonRow.with_ability_score_label();
            this.wisdom_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.wisdom_listbox.add(this.wisdom_score);
            this.wisdom_listbox.add(new SeparatorRow());
            this.wisdom_listbox.add(this.wisdom_save);
            this.wisdom_listbox.add(new SeparatorRow());

            this.charisma_score = new SpinButtonRow.with_ability_score_label();
            this.charisma_save = new SpinButtonCheckboxRow(_("Saving Throws"));

            this.charisma_listbox.add(this.charisma_score);
            this.charisma_listbox.add(new SeparatorRow());
            this.charisma_listbox.add(this.charisma_save);
            this.charisma_listbox.add(new SeparatorRow());
        }

        private void setup_view_skills()
        {
            // strength
            this.add_skill_row(Ability.STRENGTH, "athletics", _("Athletics"), false);

            // dexterity
            this.add_skill_row(Ability.DEXTERITY, "acrobatics", _("Acrobatics"));
            this.add_skill_row(Ability.DEXTERITY, "sleight_of_hand", _("Sleight of Hand"));
            this.add_skill_row(Ability.DEXTERITY, "stealth", _("Stealth"), false);

            // intelligence
            this.add_skill_row(Ability.INTELLIGENCE, "arcana", _("Arcana"));
            this.add_skill_row(Ability.INTELLIGENCE, "history", _("History"));
            this.add_skill_row(Ability.INTELLIGENCE, "investigation", _("Investigation"));
            this.add_skill_row(Ability.INTELLIGENCE, "nature", _("Nature"));
            this.add_skill_row(Ability.INTELLIGENCE, "religion", _("Religion"), false);

            // wisdom
            this.add_skill_row(Ability.WISDOM, "animal_handling", _("Animal Handling"));
            this.add_skill_row(Ability.WISDOM, "insight", _("Insight"));
            this.add_skill_row(Ability.WISDOM, "medicine", _("Medicine"));
            this.add_skill_row(Ability.WISDOM, "perception", _("Perception"));
            this.add_skill_row(Ability.WISDOM, "survival", _("Survival"), false);

            // charisma
            this.add_skill_row(Ability.CHARISMA, "deception", _("Deception"));
            this.add_skill_row(Ability.CHARISMA, "intimidation", _("Intimidation"));
            this.add_skill_row(Ability.CHARISMA, "performance", _("Performance"));
            this.add_skill_row(Ability.CHARISMA, "persuasion", _("Persuasion"), false);
        }

        private void add_skill_row(Ability ability, string skill, string label, bool separator=true)
        {
            var skill_row = new SpinButtonCheckboxRow(label);
            skill_row.set_name(skill);

            this.abilities.get(ability).add(skill_row);
            this.skills.add(skill_row);

            if (separator)
            {
                this.abilities.get(ability).add(new SeparatorRow());
            }
        }

        public void bind_character(CharacterSheet character)
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

            foreach (ListBoxRow row in this.skills)
            {
                var name = row.get_name();

                character.bind(@"$(name)_skill_proficiency", row, "active");
                character.bind(@"$(name)_skill", row, "value");
            }
        }
    }
}