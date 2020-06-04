namespace DungeonJournal
{
    public class CharacterFeat : Object
    {
        public string name {get; set; }
        public string description {get; set; }

        public CharacterFeat(string name="", string description="")
        {
            Object();

            this.name = name;
            this.description = description;
        }
    }
}