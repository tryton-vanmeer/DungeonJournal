namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/ability_skills.ui")]
    public class CharacterAbilitySkillView : Gtk.Bin
    {
        // Ability Scores
        [GtkChild]
        private AbilityScore strength_ability_score;

        [GtkChild]
        private AbilityScore dexterity_ability_score;

        [GtkChild]
        private AbilityScore constitution_ability_score;

        [GtkChild]
        private AbilityScore intelligence_ability_score;

        [GtkChild]
        private AbilityScore wisdom_ability_score;

        [GtkChild]
        private AbilityScore charisma_ability_score;

        // Saving Throws
        [GtkChild]
        private AbilitySkill strength_save_skill;

        [GtkChild]
        private AbilitySkill dexterity_save_skill;

        [GtkChild]
        private AbilitySkill constitution_save_skill;

        [GtkChild]
        private AbilitySkill intelligence_save_skill;

        [GtkChild]
        private AbilitySkill wisdom_save_skill;

        [GtkChild]
        private AbilitySkill charisma_save_skill;

        // Skills
        [GtkChild]
        private AbilitySkill athletics_skill;

        [GtkChild]
        private AbilitySkill acrobatics_skill;

        [GtkChild]
        private AbilitySkill sleight_of_hand_skill;

        [GtkChild]
        private AbilitySkill stealth_skill;

        [GtkChild]
        private AbilitySkill arcana_skill;

        [GtkChild]
        private AbilitySkill history_skill;

        [GtkChild]
        private AbilitySkill investigation_skill;

        [GtkChild]
        private AbilitySkill nature_skill;

        [GtkChild]
        private AbilitySkill religion_skill;

        [GtkChild]
        private AbilitySkill animal_handling_skill;

        [GtkChild]
        private AbilitySkill insight_skill;

        [GtkChild]
        private AbilitySkill medicine_skill;

        [GtkChild]
        private AbilitySkill perception_skill;

        [GtkChild]
        private AbilitySkill survival_skill;

        [GtkChild]
        private AbilitySkill deception_skill;

        [GtkChild]
        private AbilitySkill intimidation_skill;

        [GtkChild]
        private AbilitySkill performance_skill;

        [GtkChild]
        private AbilitySkill persuasion_skill;

        public void bind_character(ref CharacterSheet character)
        {
            // Ability Scores
            character.bind_property("strength_score", this.strength_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("dexterity_score", this.dexterity_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("constitution_score", this.constitution_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("intelligence_score", this.intelligence_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("wisdom_score", this.wisdom_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("charisma_score", this.charisma_ability_score.ability_score_adjustment, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            // Saving Throws
            character.bind_property("strength_save_proficiency", this.strength_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("strength_save", this.strength_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("dexterity_save_proficiency", this.dexterity_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("dexterity_save", this.dexterity_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("constitution_save_proficiency", this.constitution_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("constitution_save", this.constitution_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("intelligence_save_proficiency", this.intelligence_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("intelligence_save", this.intelligence_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("wisdom_save_proficiency", this.wisdom_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("wisdom_save", this.wisdom_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("charisma_save_proficiency", this.charisma_save_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("charisma_save", this.charisma_save_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            // Skills
            character.bind_property("athletics_skill_proficiency", this.athletics_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("athletics_skill", this.athletics_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("acrobatics_skill_proficiency", this.acrobatics_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("acrobatics_skill", this.acrobatics_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("sleight_of_hand_skill_proficiency", this.sleight_of_hand_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("sleight_of_hand_skill", this.sleight_of_hand_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("stealth_skill_proficiency", this.stealth_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("stealth_skill", this.stealth_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("arcana_skill_proficiency", this.arcana_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("arcana_skill", this.arcana_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("history_skill_proficiency", this.history_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("history_skill", this.history_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("investigation_skill_proficiency", this.investigation_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("investigation_skill", this.investigation_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("nature_skill_proficiency", this.nature_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("nature_skill", this.nature_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("religion_skill_proficiency", this.religion_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("religion_skill", this.religion_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("animal_handling_skill_proficiency", this.animal_handling_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("animal_handling_skill", this.animal_handling_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("insight_skill_proficiency", this.insight_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("insight_skill", this.insight_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("medicine_skill_proficiency", this.medicine_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("medicine_skill", this.medicine_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("perception_skill_proficiency", this.perception_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("perception_skill", this.perception_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("survival_skill_proficiency", this.survival_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("survival_skill", this.survival_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("deception_skill_proficiency", this.deception_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("deception_skill", this.deception_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("intimidation_skill_proficiency", this.intimidation_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("intimidation_skill", this.intimidation_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("performance_skill_proficiency", this.performance_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("performance_skill", this.performance_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);

            character.bind_property("persuasion_skill_proficiency", this.persuasion_skill.skill_proficiency_button, "active", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            character.bind_property("persuasion_skill", this.persuasion_skill.skill_save_entry, "value", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}