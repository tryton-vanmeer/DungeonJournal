using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterSkillRow.ui")]
    public class CharacterSkillRow: Adw.ExpanderRow
    {
        [GtkChild] protected unowned Adw.SpinRow skill_value;
        [GtkChild] protected unowned Adjustment skill_adjustment;

        public double value
        {
            get
            {
                return this.skill_value.value;
            }

            set
            {
                this.skill_value.value = value;
            }
        }

        public CharacterSkillRow(string title)
        {
                Object();
                this.connect_properties();

                this.title = title;
        }

        private void connect_properties() {
                this.skill_adjustment.value_changed.connect(() => {
                        this.notify_property("value");
                    });
            }
    }
}
