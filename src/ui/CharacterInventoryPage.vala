using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInventoryPage.ui")]
    public class CharacterInventoryPage : Box
    {
        public CharacterInventoryPage()
        {
            Object();
            this.set_property("icon-name", "user-info-symbolic");
        }

        public void bind_character(ref CharacterSheet character)
        {
        }
    }
}