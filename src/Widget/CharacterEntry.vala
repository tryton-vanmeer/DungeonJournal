namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/widget/character_entry.ui")]
    public class CharacterEntry : Gtk.Box
    {
        [GtkChild]
        private Gtk.Label label;

        [GtkChild]
        private Gtk.Entry entry;

        public string entry_name
        {
            set { this.label.label = value; }
        }

        public string text
        {
            set { this.entry.text = value; }
            get { return this.entry.text; }
        }
    }
}