namespace DungeonJournal
{ 
    public class CharacterSheet : Object
    {
        // Info
        public string name { get; set; }
        public string class { get; set; }
        public string race { get; set; }
        public int alignment { get; set; default = 4; }
        public string level { get; set; }
        public string xp { get; set; }

        // Stats
        public string proficiency_bonus { get; set; }
        public string armor_class { get; set; }
        public string initiative { get; set; }
        public string speed { get; set; }
        public string hp_max { get; set; }
        public double hp_current { get; set; }
        public string hit_dice { get; set; }

        // Abiltiy
        public double strength_score { get; set; default=8.0; }
        public double dexterity_score { get; set; default=8.0; }
        public double constitution_score { get; set; default=8.0; }
        public double intelligence_score { get; set; default=8.0; }
        public double wisdom_score { get; set; default=8.0; }
        public double charisma_score { get; set; default=8.0; }

        public bool strength_save_proficiency { get; set; }
        public string strength_save { get; set; }

        public bool dexterity_save_proficiency { get; set; }
        public string dexterity_save { get; set; }

        public bool constitution_save_proficiency { get; set; }
        public string constitution_save { get; set; }

        public bool intelligence_save_proficiency { get; set; }
        public string intelligence_save { get; set; }

        public bool wisdom_save_proficiency { get; set; }
        public string wisdom_save { get; set; }

        public bool charisma_save_proficiency { get; set; }
        public string charisma_save { get; set; }

        // Skills
        public bool athletics_skill_proficiency { get; set; }
        public string athletics_skill { get; set; }

        public bool acrobatics_skill_proficiency { get; set; }
        public string acrobatics_skill { get; set; }

        public bool sleight_of_hand_skill_proficiency { get; set; }
        public string sleight_of_hand_skill { get; set; }

        public bool stealth_skill_proficiency { get; set; }
        public string stealth_skill { get; set; }

        public bool arcana_skill_proficiency { get; set; }
        public string arcana_skill { get; set; }

        public bool history_skill_proficiency { get; set; }
        public string history_skill { get; set; }

        public bool investigation_skill_proficiency { get; set; }
        public string investigation_skill { get; set; }

        public bool nature_skill_proficiency { get; set; }
        public string nature_skill { get; set; }

        public bool religion_skill_proficiency { get; set; }
        public string religion_skill { get; set; }

        public bool animal_handling_skill_proficiency { get; set; }
        public string animal_handling_skill { get; set; }

        public bool insight_skill_proficiency { get; set; }
        public string insight_skill { get; set; }

        public bool medicine_skill_proficiency { get; set; }
        public string medicine_skill { get; set; }

        public bool perception_skill_proficiency { get; set; }
        public string perception_skill { get; set; }

        public bool survival_skill_proficiency { get; set; }
        public string survival_skill { get; set; }

        public bool deception_skill_proficiency { get; set; }
        public string deception_skill { get; set; }

        public bool intimidation_skill_proficiency { get; set; }
        public string intimidation_skill { get; set; }

        public bool performance_skill_proficiency { get; set; }
        public string performance_skill { get; set; }

        public bool persuasion_skill_proficiency { get; set; }
        public string persuasion_skill { get; set; }
    }
}