using Gtk;
using Gee;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Box
    {
        [GtkChild] protected unowned ListBox info_listbox;
        [GtkChild] protected unowned ListBox stats_listbox;
        [GtkChild] protected unowned ListBox feats_listbox;
        [GtkChild] protected unowned ListBoxRow feats_row_button;

        // Info
        protected EntryRow info_name;
        protected EntryRow info_class;
        protected EntryRow info_race;
        protected Adw.ComboRow info_alignment;
        protected Adw.SpinRow info_level;
        protected Adw.SpinRow info_xp;

        // Stats
        protected Adw.SpinRow stats_proficiency_bonus;
        protected Adw.SpinRow stats_armor_class;
        protected Adw.SpinRow stats_initiative;
        protected Adw.SpinRow stats_speed;
        protected Adw.SpinRow stats_hp_max;
        protected Adw.SpinRow stats_hp_current;
        protected Adw.SpinRow stats_hp_temp;
        protected Adw.ComboRow stats_hit_dice;

        // Feats
        protected ArrayList<CharacterFeat> feats { get; set; }

        public CharacterInfoPage()
        {
            Object();

            this.setup_info();
            this.setup_stats();
            this.setup_feats();
        }

        private void setup_info()
        {
            this.info_name = new EntryRow(_("Character Name"));
            this.info_class = new EntryRow(_("Class"));
            this.info_race = new EntryRow(_("Race"));

            string[] alignments = {
                "Lawful Good",
                "Neutral Good",
                "Chaotic Good",
                "Neutral",
                "Lawful Evil",
                "Neutral Evil",
                "Chaotic Evil"
            };
            this.info_alignment = new Adw.ComboRow();
            this.info_alignment.title = "Alignment";
            this.info_alignment.model = new StringList(alignments);

            this.info_level = this.spin_row_with_label("Level");
            this.info_xp = this.spin_row_with_label("Experience Points");

            this.info_listbox.append(this.info_name);
            this.info_listbox.append(this.info_class);
            this.info_listbox.append(this.info_race);
            this.info_listbox.append(this.info_alignment);
            this.info_listbox.append(this.info_level);
            this.info_listbox.append(this.info_xp);
        }

        public Adw.SpinRow spin_row_with_label(string label) {
            var row = new Adw.SpinRow(new Gtk.Adjustment(0, 0, 100, 1, 5, 10), 1, 0);
            row.title = label;
            return row;
        }

        public void setup_stats()
        {
            this.stats_proficiency_bonus = this.spin_row_with_label("Proficiency Bonus");
            this.stats_armor_class = this.spin_row_with_label("Armor Class");
            this.stats_initiative = this.spin_row_with_label("Initiative");
            this.stats_speed = this.spin_row_with_label("Speed");
            this.stats_hp_max = this.spin_row_with_label("Hit Point Maximum");
            this.stats_hp_current = this.spin_row_with_label("Current Hit Points");
            this.stats_hp_temp = this.spin_row_with_label("Temporary Hit Points");

            // Util.ARRAY_DICE had bogus entries for some reason
            string[] ARRAY_DICE = {
                "d4",
                "d6",
                "d8",
                "d10",
                "d12",
                "d20"
            };

            this.stats_hit_dice = new Adw.ComboRow();
            this.stats_hit_dice.selectable = false;
            this.stats_hit_dice.title = "Hit Dice";
            this.stats_hit_dice.model = new StringList(ARRAY_DICE);

            this.stats_listbox.append(this.stats_proficiency_bonus);
            this.stats_listbox.append(this.stats_armor_class);
            this.stats_listbox.append(this.stats_initiative);
            this.stats_listbox.append(this.stats_speed);
            this.stats_listbox.append(this.stats_hp_max);
            this.stats_listbox.append(this.stats_hp_current);
            this.stats_listbox.append(this.stats_hp_temp);
            this.stats_listbox.append(this.stats_hit_dice);
        }

        private void setup_feats()
        {
            this.feats = new ArrayList<CharacterFeat>();
        }

        public void bind_character(CharacterSheet character)
        {
            // Info
            character.bind("name", this.info_name, "text");
            character.bind("class", this.info_class, "text");
            character.bind("race", this.info_race, "text");
            character.bind("alignment", this.info_alignment, "selected");
            character.bind("level", this.info_level, "value");
            character.bind("xp", this.info_xp, "value");

            // Stats
            character.bind("proficiency_bonus", this.stats_proficiency_bonus, "value");
            character.bind("armor_class", this.stats_armor_class, "value");
            character.bind("initiative", this.stats_initiative, "value");
            character.bind("speed", this.stats_speed, "value");
            character.bind("hp_max", this.stats_hp_max, "value");
            character.bind("hp_current", this.stats_hp_current, "value");
            character.bind("hp_temp", this.stats_hp_temp, "value");
            character.bind("hit_dice", this.stats_hit_dice, "selected");

            // Feats
            character.bind("feats", this, "feats");

            // Clear feats_listbox
            var i = 0;
            while (this.feats_listbox.get_row_at_index(i) != null)
            {
                var row = this.feats_listbox.get_row_at_index(i);
                if (row != this.feats_row_button)
                {
                    this.feats_listbox.remove(row);
                }
                i ++;
            }

            foreach (var feat in this.feats)
            {
                this.add_feat_row(ref feat, true);
            }
        }

        private void add_feat_row(ref CharacterFeat feat, bool collapse = false)
        {
            var length = 0;
            while ( this.feats_listbox.get_row_at_index(length) != null) length ++;
            var pos = (int) length - 1;
            var row = new CharacterFeatRow(ref feat);

            if (collapse)
            {
                row.collapse_row();
            }
            this.feats_listbox.insert(row, pos);
        }

        [GtkCallback]
        public void on_feats_row_clicked(ListBoxRow row)
        {
            if (row == this.feats_row_button)
            {
                var feat = new CharacterFeat();
                this.feats.add(feat);

                this.add_feat_row(ref feat);
            }

            else if (row.get_type() == typeof(CharacterFeatRow))
            {
                // Delete Feat
                var feat_row = (CharacterFeatRow) row;
                this.feats.remove(feat_row.feat);
                this.feats_listbox.remove(feat_row);
            }
        }
    }
}
