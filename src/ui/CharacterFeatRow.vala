using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow : ListBoxRow, CharacterRowInterface
    {
        [GtkChild] protected Label name_label;
        [GtkChild] protected Button expand_button { get; }
        [GtkChild] protected Button delete_button { get; }
        [GtkChild] protected Image expand_image { get; }
        [GtkChild] protected Box expand_box { get; }

        [GtkChild] protected Entry name_entry;
        [GtkChild] protected TextView description_entry;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.feat.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);

            this.name_label.bind_property("label", this.name_entry, "text", Util.BINDING_FLAGS);
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