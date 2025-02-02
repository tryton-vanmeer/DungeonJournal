using Gtk;

namespace DungeonJournal
{
    public class CharacterSkillRow : Object
    {
        protected Gtk.Switch skill_switch;
        public Adw.SpinRow skill_row;
        protected Adjustment skill_adjustment;

        public double value
        {
            get
            {
                return this.skill_adjustment.value;
            }

            set
            {
                this.skill_adjustment.value = value;
            }
        }

        public bool proficient
        {
            get
            {
                return this.skill_switch.active;
            }

            set
            {
                this.skill_switch.active = value;
            }
        }

        public CharacterSkillRow(string title)
        {
                Object();
                this.skill_adjustment = new Gtk.Adjustment(0, 0, 100, 1, 10, 0);
                this.skill_row = new Adw.SpinRow(this.skill_adjustment, 1, 0);
                this.skill_switch = new Gtk.Switch();
                this.skill_switch.set_valign(Gtk.Align.CENTER);
                this.skill_row.add_suffix(this.skill_switch);
                this.skill_row.title = title;

                this.connect_properties();
        }

        private void connect_properties()
        {
                this.skill_adjustment.value_changed.connect(() => {
                        this.notify_property("value");
                });
                this.skill_switch.notify["active"].connect(() => {
                        this.notify_property("proficient");
                });
        }
    }
}
