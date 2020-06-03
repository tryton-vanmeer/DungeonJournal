namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox info;
        [GtkChild] protected Gtk.ListBox stats;
        [GtkChild] protected Gtk.ListBox feats;
        [GtkChild] protected Gtk.ListBoxRow feats_add_row;

        // Info
        protected EntryRow info_name;
        protected EntryRow info_class;
        protected EntryRow race;
        protected ComboBoxRow alignment;
        protected SpinButtonRow level;
        protected SpinButtonRow xp;

        // Stats
        protected SpinButtonRow proficiency_bonus;
        protected SpinButtonRow armor_class;
        protected SpinButtonRow initiative;
        protected SpinButtonRow speed;
        protected SpinButtonRow hp_max;
        protected SpinButtonRow hp_current;
        protected SpinButtonRow hp_temp;
        protected ComboBoxRow hit_dice;

        public CharacterInfoPage()
        {
            Object();

            this.setup_info();
            this.setup_stats();
        }

        private void setup_info()
        {
            this.info_name = new EntryRow(_("Character Name"));
            this.info_class = new EntryRow(_("Class"));
            this.race = new EntryRow(_("Race"));

            string[] alignments = {
                _("Lawful Good"),
                _("Neutral Good"),
                _("Chaotic Good"),
                _("Neutral"),
                _("Lawful Evil"),
                _("Neutral Evil"),
                _("Chaotic Evil")
            };
            this.alignment = new ComboBoxRow(_("Alignment"), alignments);

            this.level = new SpinButtonRow(_("Level"));
            this.xp = new SpinButtonRow(_("Experience Points"));

            this.info.add(this.info_name);
            this.info.add(new SeparatorRow());
            this.info.add(this.info_class);
            this.info.add(new SeparatorRow());
            this.info.add(this.race);
            this.info.add(new SeparatorRow());
            this.info.add(this.alignment);
            this.info.add(new SeparatorRow());
            this.info.add(this.level);
            this.info.add(new SeparatorRow());
            this.info.add(this.xp);
        }

        public void setup_stats()
        {
            this.proficiency_bonus = new SpinButtonRow(_("Proficiency Bonus"));
            this.armor_class = new SpinButtonRow(_("Armor Class"));
            this.initiative = new SpinButtonRow(_("Initiative"));
            this.speed = new SpinButtonRow(_("Speed"));
            this.hp_max = new SpinButtonRow(_("Hit Point Maximum"));
            this.hp_current = new SpinButtonRow(_("Current Hit Points"));
            this.hp_temp = new SpinButtonRow(_("Temporary Hit Points"));
            this.hit_dice = new ComboBoxRow(_("Hit Dice"), Util.ARRAY_DICE);

            this.stats.add(this.proficiency_bonus);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.armor_class);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.initiative);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.speed);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.hp_max);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.hp_current);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.hp_temp);
            this.stats.add(new SeparatorRow());
            this.stats.add(this.hit_dice);
        }

        public void bind_character(ref CharacterSheet character)
        {
            // Info
            character.bind("name", this.info_name, "text");
            character.bind("class", this.info_class, "text");
            character.bind("race", this.race, "text");
            character.bind("alignment", this.alignment, "active");
            character.bind("level", this.level, "value");
            character.bind("xp", this.xp, "value");

            // Stats
            character.bind("proficiency_bonus", this.proficiency_bonus, "value");
            character.bind("armor_class", this.armor_class, "value");
            character.bind("initiative", this.initiative, "value");
            character.bind("speed", this.speed, "value");
            character.bind("hp_max", this.hp_max, "value");
            character.bind("hp_current", this.hp_current, "value");
            character.bind("hp_temp", this.hp_temp, "value");
            character.bind("hit_dice", this.hit_dice, "active");
        }

        [GtkCallback]
        public void on_feats_add_row_clicked(Gtk.ListBoxRow row)
        {
            if (row == this.feats_add_row)
            {
                var pos = (int) this.feats.get_children().length() - 1;

                this.feats.insert(new CharacterFeatRow(), pos);
                this.feats.insert(new SeparatorRow(), pos + 1);
            }
        }
    }
}