namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/character-entry.ui")]
    public class CharacterEntry : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label label;

        [GtkChild]
        public Gtk.Entry entry;

        public string entry_name
        {
            set { this.label.label = value; }
        }
    }
}