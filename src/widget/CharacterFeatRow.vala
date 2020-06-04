namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Entry _name;
        [GtkChild] protected Gtk.TextView _description;

        public CharacterFeat feat;

        public new string name
        {
            get
            {
                return this._name.text;
            }

            set
            {
                this._name.text = value;
            }
        }

        public string description
        {
            owned get
            {
                return this._description.buffer.text;
            }

            set
            {
                this._description.buffer.text = value;
            }
        }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();
            this.feat = feat;
        }
    }
}