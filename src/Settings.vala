namespace DungeonJournal
{
    public class Settings
    {
        private GLib.Settings settings;

        private int _window_width;
        private int _window_height;

        public Settings()
        {
            this.settings = new GLib.Settings("io.github.trytonvanmeer.DungeonJournal");

            this._window_width = this.settings.get_int("window-width");
            this._window_height = this.settings.get_int("window-height");
        }

        public int window_width
        {
            get
            {
                return this._window_width;
            }
            set
            {
                this._window_width = value;
                this.settings.set_int("window-width", value);
            }
        }

        public int window_height
        {
            get
            {
                return this._window_height;
            }
            set
            {
                this._window_height = value;
                this.settings.set_int("window-height", value);
            }
        }

        public void apply()
        {
            this.settings.apply();
        }
    }
}