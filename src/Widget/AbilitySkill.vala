namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/ability_skill.ui")]
    public class AbilitySkill : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label skill_label;

        [GtkChild]
        public Gtk.ToggleButton skill_proficiency_button;

        [GtkChild]
        public Gtk.Adjustment skill_save_entry;

        public string skill_name
        {
            set { this.skill_label.label = value; }
        }

    }
}