namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Entry name_entry;
        [GtkChild] protected Gtk.TextView description;

        public CharacterFeatRow()
        {
            Object();
        }
    }
}