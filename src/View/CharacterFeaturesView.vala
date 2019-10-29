namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character/features.ui")]
    public class CharacterFeaturesView : CharacterView
    {
        [GtkChild] Gtk.TextView features_text_view;

        public void bind_character(ref CharacterSheet character)
        {
            character.bind_property("features", this.features_text_view.buffer, "text", BindingFlags.SYNC_CREATE | BindingFlags.BIDIRECTIONAL);
        }
    }
}