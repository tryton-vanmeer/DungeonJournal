namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/character-entry-adjustment.ui")]
    public class CharacterEntryAdjustment : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label label;

        [GtkChild]
        public Gtk.Adjustment adjustment;

        public string entry_name
        {
            set { this.label.label = value; }
        }
    }
}