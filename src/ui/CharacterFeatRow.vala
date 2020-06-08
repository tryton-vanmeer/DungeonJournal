using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterFeatRow.ui")]
    public class CharacterFeatRow: ListBoxRow, CharacterExpandingRow
    {
        [GtkChild] protected Entry name_entry;
        [GtkChild] protected TextView description_entry;

        public CharacterFeat feat { get; set; }

        public CharacterFeatRow(ref CharacterFeat feat)
        {
            Object();

            this.feat = feat;

            this.feat.bind_property("name", this.name_entry, "text", Util.BINDING_FLAGS);
            this.feat.bind_property("description", this.description_entry.buffer, "text", Util.BINDING_FLAGS);
        }
    }
}