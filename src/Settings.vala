namespace DungeonJournal
{
    public class Settings
    {
        private GLib.Settings settings;

        public Settings()
        {
            this.settings = new GLib.Settings("io.github.trytonvanmeer.DungeonJournal");
        }

        public void apply()
        {
            this.settings.apply();
        }
    }
}