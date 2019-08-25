namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/ability_skill.ui")]
    public class AbilitySkill : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label skill_label;

        [GtkChild]
        private Gtk.ToggleButton skill_proficiency_button;

        [GtkChild]
        private Gtk.Entry skill_save_entry;

        public string skill_name
        {
            set { this.skill_label.label = value; }
        }

        public bool skill_proficiency
        {
            set { this.skill_proficiency_button.active = value; }
            get { return this.skill_proficiency_button.active; }
        }

        public string skill_save
        {
            set { this.skill_save_entry.text = value; }
            get {return this.skill_save_entry.text; }
        }
    }
}