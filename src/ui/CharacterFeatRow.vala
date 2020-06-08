using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow : ListBoxRow
    {
        [GtkChild] protected Box box;
        [GtkChild] protected Entry name_entry;
        [GtkChild] protected TextView description_entry;

        protected ExpanderRow expander;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.feat.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);

            this.setup_view();
        }

        private void setup_view()
        {
            this.expander = new ExpanderRow();

            this.box.add(expander);
        }
    }
}