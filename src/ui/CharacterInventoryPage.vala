using Gtk;
using Gee;

namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/CharacterInventoryPage.ui")]
    public class CharacterInventoryPage : Box
    {
        [GtkChild] protected unowned ListBox currency_listbox;
        [GtkChild] protected unowned ListBox attacks_listbox;
        [GtkChild] protected unowned ListBox items_listbox;
        [GtkChild] protected unowned ListBoxRow attacks_row_button;
        [GtkChild] protected unowned ListBoxRow items_row_button;

        // Currency unowned
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

            this.currency_listbox.append(this.currency_copper);
            this.currency_listbox.append(this.currency_silver);
            this.currency_listbox.append(this.currency_gold);
        }

        private void setup_attacks()
        {
            this.attacks = new ArrayList<CharacterAttack>();
        }

        private void setup_items()
        {
            this.items = new ArrayList<CharacterItem>();
        }

        public void bind_character(CharacterSheet character)
        {
            // Currency
            character.bind("currency-copper", this.currency_copper, "value");
            character.bind("currency-silver", this.currency_silver, "value");
            character.bind("currency-gold", this.currency_gold, "value");

            // Attacks
            character.bind("attacks", this, "attacks");

            // Clear attacks_listbox
            var i = 0;
            while (this.attacks_listbox.get_row_at_index(i) != null)
            {
                var row = this.attacks_listbox.get_row_at_index(i);
                if (row != this.attacks_row_button)
                {
                    this.attacks_listbox.remove(row);
                }
                i++;
            }

            foreach (var attack in this.attacks)
            {
                add_attack_row(ref attack, true);
            }

            // Items
            character.bind("items", this, "items");

            // Clear items_listbox
            i = 0;
            while (this.items_listbox.get_row_at_index(i) != null)
            {
                var row = this.items_listbox.get_row_at_index(i);
                if (row != this.items_row_button)
                {
                    this.items_listbox.remove(row);
                }
                i++;
            }

            foreach (var item in this.items)
            {
                add_item_row(ref item, true);
            }
        }

        private void add_attack_row(ref CharacterAttack attack, bool collapse = false)
        {
            var length = 0;
            while ( this.attacks_listbox.get_row_at_index(length) != null) length ++;
            var pos = (int) length - 1;
            var row = new CharacterAttackRow(ref attack);

            if (collapse)
            {
                row.collapse_row();
            }

            this.attacks_listbox.insert(row, pos);
        }

        private void add_item_row(ref CharacterItem item, bool collapse = false)
        {
            var length = 0;
            while ( this.items_listbox.get_row_at_index(length) != null) length ++;
            var pos = (int) length - 1;
            var row = new CharacterItemRow(ref item);

            if (collapse)
            {
                row.collapse_row();
            }

            this.items_listbox.insert(row, pos);
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

            else if (row.get_type() == typeof(CharacterAttackRow))
            {
                // Delete Attack
                var attack_row = (CharacterAttackRow) row;
                this.attacks.remove(attack_row.attack);
                this.attacks_listbox.remove(attack_row);
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

            else if (row.get_type() == typeof(CharacterItemRow))
            {
                // Delete Item
                var item_row = (CharacterItemRow) row;
                this.items.remove(item_row.item);
                this.items_listbox.remove(item_row);
            }
        }
    }
}
