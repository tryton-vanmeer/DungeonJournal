namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/ability_skills.ui")]
    public class CharacterAbilitySkillView : Gtk.Bin
    {
        [GtkChild]
        private Gtk.SpinButton strength_score;

        [GtkChild]
        private Gtk.Label strength_mod;

        [GtkChild]
        private Gtk.CheckButton strength_save_proficiency;

        [GtkChild]
        private Gtk.Entry strength_save;

        [GtkChild]
        private Gtk.CheckButton athletics_skill_proficiency;

        [GtkChild]
        private Gtk.Entry athletics_skill;

        public CharacterAbilitySkillView()
        {
            connect_signals();
        }

        private void connect_signals()
        {
            this.strength_score.value_changed.connect(() =>
            {
                this.strength_mod.label = calculate_ability_modifier(this.strength_score.value);
            });
        }
    }
}