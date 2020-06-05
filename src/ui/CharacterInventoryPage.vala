using Gtk;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInventoryPage.ui")]
    public class CharacterInventoryPage : Box
    {
        [GtkChild] protected ListBox currency_listbox;
        [GtkChild] protected ListBox attacks_listbox;
        [GtkChild] protected ListBox items_listbox;
        [GtkChild] protected ListBoxRow attacks_row_button;
        [GtkChild] protected ListBoxRow items_row_button;

        public CharacterInventoryPage()
        {
            Object();
        }

        public void bind_character(ref CharacterSheet character)
        {
        }
    }
}