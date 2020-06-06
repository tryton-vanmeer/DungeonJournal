namespace DungeonJournal
{
    public class CharacterItem: Object
    {
        public string item_name { get; set; default=""; }
        public string cost { get; set; default=""; }
        public double weight { get; set; default=0; }
        public string description { get; set; default=""; }
    }
}