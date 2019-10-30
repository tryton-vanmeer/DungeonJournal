namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/character-entry-text-view.ui")]
    public class CharacterEntryTextView : Gtk.Box
    {
        [GtkChild] private Gtk.Label label;
        [GtkChild] public Gtk.TextView text;

        public string entry_name
        {
            set { this.label.label = value; }
        }
    }
}