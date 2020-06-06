using Gtk;
using Gee;

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

        // Attacks
        protected ArrayList<CharacterAttack> attacks { get; set; }

        // Items
        protected ArrayList<CharacterItem> items { get; set; }

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
            this.attacks = new ArrayList<CharacterAttack>();
        }

        private void setup_items()
        {
            this.items = new ArrayList<CharacterItem>();
        }

        public void bind_character(ref CharacterSheet character)
        {
            // Currency
            character.bind("currency-copper", this.currency_copper, "value");
            character.bind("currency-silver", this.currency_silver, "value");
            character.bind("currency-gold", this.currency_gold, "value");

            // Attacks
            character.bind("attacks", this, "attacks");

            foreach (var attack in this.attacks)
            {
                add_attack_row(ref attack);
            }
        }

        private void add_attack_row(ref CharacterAttack attack)
        {
            var pos = (int) this.attacks_listbox.get_children().length() - 1;
            this.attacks_listbox.insert(new CharacterAttackRow(ref attack), pos);
            this.attacks_listbox.insert(new SeparatorRow(), pos + 1);
        }

        private void add_item_row(ref CharacterItem item)
        {
            var pos = (int) this.items_listbox.get_children().length() - 1;
            this.items_listbox.insert(new CharacterItemRow(ref item), pos);
            this.items_listbox.insert(new SeparatorRow(), pos + 1);
        }

        [GtkCallback]
        public void on_attacks_row_clicked(ListBoxRow row)
        {
            if (row == this.attacks_row_button)
            {
                var attack = new CharacterAttack();
                this.attacks.add(attack);

                this.add_attack_row(ref attack);
            }
        }

        [GtkCallback]
        public void on_items_row_clicked(ListBoxRow row)
        {
            if (row == this.items_row_button)
            {
                var item = new CharacterItem();
                this.items.add(item);

                this.add_item_row(ref item);
            }
        }
    }
}