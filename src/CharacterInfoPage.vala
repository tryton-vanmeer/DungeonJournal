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

            this.info.add(info_name);
            this.info.add(info_class);
            this.info.add(race);
            this.info.add(alignment);
            this.info.add(level);
            this.info.add(xp);
        }

        public void setup_stats()
        {
            this.proficiency_bonus = new SpinButtonRow(_("Proficiency Bonus"));

            this.stats.add(proficiency_bonus);
        }

        public void bind_character(ref CharacterSheet character)
        {
            // Info
            character.bind_property("name", this.info_name.entry, "text", Util.BINDING_FLAGS);
            character.bind_property("class", this.info_class.entry, "text", Util.BINDING_FLAGS);
            character.bind_property("race", this.race.entry, "text", Util.BINDING_FLAGS);
            character.bind_property("alignment", this.alignment.combo, "active", Util.BINDING_FLAGS);
            character.bind_property("level", this.level.adjustment, "value", Util.BINDING_FLAGS);
            character.bind_property("xp", this.xp.adjustment, "value", Util.BINDING_FLAGS);

            // Stats
            character.bind_property("proficiency_bonus", this.proficiency_bonus.adjustment, "value", Util.BINDING_FLAGS);
        }
    }
}