namespace DungeonJournal
{
    public class CharacterFeat : Object
    {
        public string name;
        public string description;

        public CharacterFeat(string name="", string description="")
        {
            Object();

            this.name = name;
            this.description = description;
        }
    }
}