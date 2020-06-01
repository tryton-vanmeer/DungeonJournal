namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInfoPage.ui")]
    public class CharacterInfoPage : Gtk.Box
    {
        [GtkChild] protected Gtk.ListBox info;

        protected EntryRow info_name;
        protected EntryRow info_class;
        protected EntryRow info_race;
        protected ComboBoxRow info_alignment;
        protected SpinButtonRow info_level;

        public CharacterInfoPage()
        {
            Object();

            setup_view();
        }

        private void setup_view()
        {
            info_name = new EntryRow(_("Character Name"));
            info_class = new EntryRow(_("Class"));
            info_race = new EntryRow(_("Race"));

            string[] alignments = {
                _("Lawful Good"),
                _("Neutral Good"),
                _("Chaotic Good"),
                _("Neutral"),
                _("Lawful Evil"),
                _("Neutral Evil"),
                _("Chaotic Evil")
            };
            info_alignment = new ComboBoxRow(_("Alignment"), alignments);

            info_level = new SpinButtonRow(_("Level"));

            info.add(info_name);
            info.add(info_class);
            info.add(info_race);
            info.add(info_alignment);
            info.add(info_level);
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("name", this.info_name.entry, "text", BINDING_FLAGS);
            character.bind_property("class", this.info_class.entry, "text", BINDING_FLAGS);
            character.bind_property("race", this.info_race.entry, "text", BINDING_FLAGS);
            character.bind_property("alignment", this.info_alignment.combo, "active", BINDING_FLAGS);
            character.bind_property("level", this.info_level.adjustment, "value", BINDING_FLAGS);
        }
    }
}