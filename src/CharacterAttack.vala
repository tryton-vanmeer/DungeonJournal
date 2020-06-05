namespace DungeonJournal
{
    public class CharacterAttack: Object
    {
        public string weapon_entry { get; set; default=""; }
        public string type_entry { get; set; default=""; }
        public string range_entry { get; set; default=""; }
        public string atkbonus_entry { get; set; default=""; }
        public string damage_entry { get; set; default=""; }
    }
}