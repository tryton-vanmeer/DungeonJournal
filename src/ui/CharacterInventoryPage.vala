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

        // Currency
        protected SpinButtonRow currency_copper;
        protected SpinButtonRow currency_silver;
        protected SpinButtonRow currency_gold;

        public CharacterInventoryPage()
        {
            Object();

            this.setup_currency();
            this.setup_attacks();
            this.setup_items();
        }

        private void setup_currency()
        {
            this.currency_copper = new SpinButtonRow(_("Copper"));
            this.currency_silver = new SpinButtonRow(_("Silver"));
            this.currency_gold = new SpinButtonRow(_("Gold"));

            this.currency_listbox.add(this.currency_copper);
            this.currency_listbox.add(this.currency_silver);
            this.currency_listbox.add(this.currency_gold);
        }

        private void setup_attacks()
        {
        }

        private void setup_items()
        {
        }

        public void bind_character(ref CharacterSheet character)
        {
            character.bind("currency-copper", this.currency_copper, "value");
            character.bind("currency-silver", this.currency_silver, "value");
            character.bind("currency-gold", this.currency_gold, "value");
        }
    }
}