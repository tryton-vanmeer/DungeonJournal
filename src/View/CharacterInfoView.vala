namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/info.ui")]
    public class CharacterInfoView : Gtk.Bin
    {
        [GtkChild]
        protected Gtk.Entry character_name_entry;

        [GtkChild]
        protected Gtk.Entry character_class_entry;

        [GtkChild]
        protected Gtk.Entry character_race_entry;

        [GtkChild]
        protected Gtk.ComboBoxText character_alignment_entry;

        [GtkChild]
        protected Gtk.Entry character_level_entry;

        [GtkChild]
        protected Gtk.Entry character_xp_entry;
    }
}