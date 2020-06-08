using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow : ListBoxRow
    {
        private const string[] expand_button_icons = {"go-next-symbolic", "go-down-symbolic"};

        [GtkChild] protected Label name_label;
        [GtkChild] protected Button expand_button;
        [GtkChild] protected Image expand_image;
        [GtkChild] protected Box expand_box;

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
            this.expand_box.visible = !this.expand_box.visible;
            this.expand_image.icon_name = expand_button_icons[(int) this.expand_box.visible];
        }
    }
}