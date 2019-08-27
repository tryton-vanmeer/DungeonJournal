namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/ability_score.ui")]
    public class AbilityScore : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label ability_score_label;

        [GtkChild]
        public Gtk.Label ability_score_mod;

        [GtkChild]
        public Gtk.Adjustment ability_score_adjustment;

        construct
        {
            // Update ability modifier when user changes ability score            
            this.ability_score_adjustment.value_changed.connect(() =>
            {
                this.ability_score_mod.label = calculate_ability_modifier(this.ability_score_adjustment.value);
            });
        }

        public string ability_name
        {
            set { this.ability_score_label.label = value; }
        }
    }
}