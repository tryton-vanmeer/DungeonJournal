namespace DungeonJournal
{
    public class CharacterAttack: Object
    {
        public string weapon { get; set; default=""; }
        public string range { get; set; default=""; }
        public string atkbonus { get; set; default=""; }
        public string damage { get; set; default=""; }
    }
}