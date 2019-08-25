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

        public CharacterAbilitySkillView()
        {
            connect_signals();
        }

        private void connect_signals()
        {

        }
    }
}