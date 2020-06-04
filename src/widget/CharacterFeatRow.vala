namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Entry _name;
        [GtkChild] protected Gtk.TextView _description;

        public CharacterFeatRow()
        {
            Object();
        }
    }
}