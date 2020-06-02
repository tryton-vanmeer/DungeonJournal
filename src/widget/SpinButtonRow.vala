namespace DungeonJournal
{
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/SpinButtonRow.ui")]
    public class SpinButtonRow: Gtk.ListBoxRow
    {
        [GtkChild] protected Gtk.Label label;
        [GtkChild] public Gtk.Adjustment adjustment;

        public SpinButtonRow(string label)
        {
            Object();

            this.label.label = label;
        }

        public SpinButtonRow.with_ability_score_label()
        {
            Object();

            this.set_label_to_ability_modifier();

            this.adjustment.value_changed.connect(
                this.set_label_to_ability_modifier
            );
        }

        private void set_label_to_ability_modifier()
        {
            var modifier = Util.calculate_ability_modifier(this.adjustment.value);
            this.label.label = modifier;
        }
    }
}