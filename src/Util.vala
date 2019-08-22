namespace DungeonJournal
{
    public string calculate_ability_modifier(double ability_score)
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