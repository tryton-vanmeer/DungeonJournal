using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow : Adw.ExpanderRow, CharacterRowInterface
    {
        [GtkChild] protected unowned Button delete_button { get; }

        [GtkChild] protected unowned Adw.EntryRow name_entry;
        [GtkChild] protected unowned TextView description_entry;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.feat.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);

            this.name_entry.bind_property("text", this, "title", BindingFlags.SYNC_CREATE);
            // this.description_entry.buffer.bind_property("text", this, "subtitle", BindingFlags.SYNC_CREATE);

            this.set_expanded(true);
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }
    }
}
