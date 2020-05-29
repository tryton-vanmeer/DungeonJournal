namespace DungeonJournal
{
    public class CharacterSheet : Object
    {
        // Info
        public string name { get; set; default=""; }
        public string class { get; set; default=""; }
        public string race { get; set; default=""; }
        public int alignment { get; set; default = 4; }
        public double level { get; set; default=1; }
        public double xp { get; set; default=0; }

        // Stats
        public double proficiency_bonus { get; set; default=2; }
        public double armor_class { get; set; default=0; }
        public double initiative { get; set; default=0; }
        public double speed { get; set; default=0; }
        public double hp_max { get; set; default=0; }
        public double hp_current { get; set; default=0; }
        public double hp_temp { get; set; default=0; }
        public string hit_dice { get; set; default=""; }

        // Abiltiy
        public double strength_score { get; set; default=8.0; }
        public double dexterity_score { get; set; default=8.0; }
        public double constitution_score { get; set; default=8.0; }
        public double intelligence_score { get; set; default=8.0; }
        public double wisdom_score { get; set; default=8.0; }
        public double charisma_score { get; set; default=8.0; }

        public bool strength_save_proficiency { get; set; }
        public double strength_save { get; set; default=0; }

        public bool dexterity_save_proficiency { get; set; }
        public double dexterity_save { get; set; default=0; }

        public bool constitution_save_proficiency { get; set; }
        public double constitution_save { get; set; default=0; }

        public bool intelligence_save_proficiency { get; set; }
        public double intelligence_save { get; set; default=0; }

        public bool wisdom_save_proficiency { get; set; }
        public double wisdom_save { get; set; default=0; }

        public bool charisma_save_proficiency { get; set; }
        public double charisma_save { get; set; default=0; }

        // Skills
        public bool athletics_skill_proficiency { get; set; }
        public double athletics_skill { get; set; default=0; }

        public bool acrobatics_skill_proficiency { get; set; }
        public double acrobatics_skill { get; set; default=0; }

        public bool sleight_of_hand_skill_proficiency { get; set; }
        public double sleight_of_hand_skill { get; set; default=0; }

        public bool stealth_skill_proficiency { get; set; }
        public double stealth_skill { get; set; default=0; }

        public bool arcana_skill_proficiency { get; set; }
        public double arcana_skill { get; set; default=0; }

        public bool history_skill_proficiency { get; set; }
        public double history_skill { get; set; default=0; }

        public bool investigation_skill_proficiency { get; set; }
        public double investigation_skill { get; set; default=0; }

        public bool nature_skill_proficiency { get; set; }
        public double nature_skill { get; set; default=0; }

        public bool religion_skill_proficiency { get; set; }
        public double religion_skill { get; set; default=0; }

        public bool animal_handling_skill_proficiency { get; set; }
        public double animal_handling_skill { get; set; default=0; }

        public bool insight_skill_proficiency { get; set; }
        public double insight_skill { get; set; default=0; }

        public bool medicine_skill_proficiency { get; set; }
        public double medicine_skill { get; set; default=0; }

        public bool perception_skill_proficiency { get; set; }
        public double perception_skill { get; set; default=0; }

        public bool survival_skill_proficiency { get; set; }
        public double survival_skill { get; set; default=0; }

        public bool deception_skill_proficiency { get; set; }
        public double deception_skill { get; set; default=0; }

        public bool intimidation_skill_proficiency { get; set; }
        public double intimidation_skill { get; set; default=0; }

        public bool performance_skill_proficiency { get; set; }
        public double performance_skill { get; set; default=0; }

        public bool persuasion_skill_proficiency { get; set; }
        public double persuasion_skill { get; set; default=0; }
    }
}