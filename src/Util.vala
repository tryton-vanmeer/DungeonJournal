namespace DungeonJournal
{
    public const BindingFlags BINDING_FLAGS = BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL;

    public class Util
    {
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