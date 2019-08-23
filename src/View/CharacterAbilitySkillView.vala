namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/ability_skills.ui")]
    public class CharacterAbilitySkillView : Gtk.Bin
    {
        // Abiltiy Scores

        [GtkChild]
        private Gtk.Adjustment strength_score_adjustment;

        [GtkChild]
        private Gtk.Adjustment dexterity_score_adjustment;

        [GtkChild]
        private Gtk.Adjustment constitution_score_adjustment;

        [GtkChild]
        private Gtk.Adjustment intelligence_score_adjustment;

        [GtkChild]
        private Gtk.Adjustment wisdom_score_adjustment;

        [GtkChild]
        private Gtk.Adjustment charisma_score_adjustment;

        // Abiltiy Scores Modifiers

        [GtkChild]
        private Gtk.Label strength_mod;

        [GtkChild]
        private Gtk.Label dexterity_mod;

        [GtkChild]
        private Gtk.Label constitution_mod;

        [GtkChild]
        private Gtk.Label intelligence_mod;

        [GtkChild]
        private Gtk.Label wisdom_mod;

        [GtkChild]
        private Gtk.Label charisma_mod;

        // Abiltiy Score Saves Proficiencies

        [GtkChild]
        private Gtk.CheckButton strength_save_proficiency;

        [GtkChild]
        private Gtk.CheckButton dexterity_save_proficiency;

        [GtkChild]
        private Gtk.CheckButton constitution_save_proficiency;

        [GtkChild]
        private Gtk.CheckButton intelligence_save_proficiency;

        [GtkChild]
        private Gtk.CheckButton wisdom_save_proficiency;

        [GtkChild]
        private Gtk.CheckButton charisma_save_proficiency;

        // Abiltiy Score Saves

        [GtkChild]
        private Gtk.Entry strength_save;

        [GtkChild]
        private Gtk.Entry dexterity_save;

        [GtkChild]
        private Gtk.Entry constitution_save;

        [GtkChild]
        private Gtk.Entry intelligence_save;

        [GtkChild]
        private Gtk.Entry wisdom_save;

        [GtkChild]
        private Gtk.Entry charisma_save;

        // Skill Proficiencies

        [GtkChild]
        private Gtk.CheckButton athletics_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton acrobatics_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton sleight_of_hand_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton stealth_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton arcana_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton history_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton investigation_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton nature_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton religion_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton animal_handling_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton insight_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton medicine_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton perception_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton survival_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton deception_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton intimidation_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton performance_skill_proficiency;

        [GtkChild]
        private Gtk.CheckButton persuasion_skill_proficiency;

        // Skills

        [GtkChild]
        private Gtk.Entry athletics_skill;

        [GtkChild]
        private Gtk.Entry acrobatics_skill;

        [GtkChild]
        private Gtk.Entry sleight_of_hand_skill;

        [GtkChild]
        private Gtk.Entry stealth_skill;

        [GtkChild]
        private Gtk.Entry arcana_skill;

        [GtkChild]
        private Gtk.Entry history_skill;

        [GtkChild]
        private Gtk.Entry investigation_skill;

        [GtkChild]
        private Gtk.Entry nature_skill;

        [GtkChild]
        private Gtk.Entry religion_skill;

        [GtkChild]
        private Gtk.Entry animal_handling_skill;

        [GtkChild]
        private Gtk.Entry insight_skill;

        [GtkChild]
        private Gtk.Entry medicine_skill;

        [GtkChild]
        private Gtk.Entry perception_skill;

        [GtkChild]
        private Gtk.Entry survival_skill;

        [GtkChild]
        private Gtk.Entry deception_skill;

        [GtkChild]
        private Gtk.Entry intimidation_skill;

        [GtkChild]
        private Gtk.Entry performance_skill;

        [GtkChild]
        private Gtk.Entry persuasion_skill;

        public CharacterAbilitySkillView()
        {
            connect_signals();
        }

        private void connect_signals()
        {
            // Abiltiy Score update Modifier

            this.strength_score_adjustment.value_changed.connect(() =>
            {
                this.strength_mod.label = calculate_ability_modifier(this.strength_score_adjustment.value);
            });

            this.dexterity_score_adjustment.value_changed.connect(() =>
            {
                this.dexterity_mod.label = calculate_ability_modifier(this.dexterity_score_adjustment.value);
            });

            this.constitution_score_adjustment.value_changed.connect(() =>
            {
                this.constitution_mod.label = calculate_ability_modifier(this.constitution_score_adjustment.value);
            });

            this.intelligence_score_adjustment.value_changed.connect(() =>
            {
                this.intelligence_mod.label = calculate_ability_modifier(this.intelligence_score_adjustment.value);
            });

            this.wisdom_score_adjustment.value_changed.connect(() =>
            {
                this.wisdom_mod.label = calculate_ability_modifier(this.wisdom_score_adjustment.value);
            });

            this.charisma_score_adjustment.value_changed.connect(() =>
            {
                this.charisma_mod.label = calculate_ability_modifier(this.charisma_score_adjustment.value);
            });
        }
    }
}