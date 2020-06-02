namespace DungeonJournal
{
    public class Util
    {
        public const string[] ARRAY_DICE = {
            "d4",
            "d6",
            "d8",
            "d10",
            "d12",
            "d20"
        };

        public static string calculate_ability_modifier(double ability_score)
        {
            double modifier = Math.floor((ability_score - 10) / 2);

            if (modifier > 0)
            {
                return @"+$modifier";
            }
            else
            {
                return @"$modifier";
            }
        }
    }
}