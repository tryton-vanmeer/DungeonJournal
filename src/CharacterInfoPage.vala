namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox info;
        [GtkChild] protected Gtk.ListBox stats;

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
            this.info.add(this.info_class);
            this.info.add(this.race);
            this.info.add(this.alignment);
            this.info.add(this.level);
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
            this.stats.add(this.armor_class);
            this.stats.add(this.initiative);
            this.stats.add(this.speed);
            this.stats.add(this.hp_max);
            this.stats.add(this.hp_current);
            this.stats.add(this.hp_temp);
            this.stats.add(this.hit_dice);
        }

        public void bind_character(ref CharacterSheet character)
        {
            // Info
            character.bind("name", this.info_name.entry, "text");
            character.bind("class", this.info_class.entry, "text");
            character.bind("race", this.race.entry, "text");
            character.bind("alignment", this.alignment.combo, "active");
            character.bind("level", this.level.adjustment, "value");
            character.bind("xp", this.xp.adjustment, "value");

            // Stats
            character.bind("proficiency_bonus", this.proficiency_bonus.adjustment, "value");
            character.bind("armor_class", this.armor_class.adjustment, "value");
            character.bind("initiative", this.initiative.adjustment, "value");
            character.bind("speed", this.speed.adjustment, "value");
            character.bind("hp_max", this.hp_max.adjustment, "value");
            character.bind("hp_current", this.hp_current.adjustment, "value");
            character.bind("hp_temp", this.hp_temp.adjustment, "value");
            character.bind("hit_dice", this.hit_dice.combo, "active");
        }
    }
}