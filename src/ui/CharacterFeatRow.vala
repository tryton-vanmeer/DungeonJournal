using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow : ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected unowned Label name_label;
        [GtkChild] protected unowned Button expand_button { get; }
        [GtkChild] protected unowned Button delete_button { get; }
        [GtkChild] protected unowned Image expand_image { get; }
        [GtkChild] protected unowned Box expand_box { get; }

        [GtkChild] protected unowned Entry name_entry;
        [GtkChild] protected unowned TextView description_entry;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.feat.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);

            this.name_entry.bind_property("text", this.name_label, "label", BindingFlags.SYNC_CREATE);
        }

        [GtkCallback]
        private void on_expand_button_clicked()
        {
            this.expand_button_clicked();
        }

        [GtkCallback]
        private void on_delete_button_clicked()
        {
            this.delete_button_clicked();
        }
    }
}
