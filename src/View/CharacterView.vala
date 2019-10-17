namespace DungeonJournal
{ 
    [GtkTemplate (ui = "/io/github/trytonvanmeer/DungeonJournal/ui/character-view.ui")]
    public class CharacterView : Gtk.Bin, Gtk.Buildable
    {
        [GtkChild]public Gtk.Box box;

        public unowned GLib.Object get_internal_child(Gtk.Builder builder, string name)
        {
            if (name == "box")
            {
                return (GLib.Object) this.box;
            }

            return null;
        }
    }
}