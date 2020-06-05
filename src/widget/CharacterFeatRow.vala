namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Entry _name;
        [GtkChild] protected Gtk.TextView _description;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this._name, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
            this.feat.bind_property("description", this._description.buffer, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}