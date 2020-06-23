namespace DungeonJournal
{
    public class Settings
    {
        private GLib.Settings settings;

        public Settings()
        {
            this.settings = new GLib.Settings(Config.APP_ID);
        }

        public void apply()
        {
            this.settings.apply();
        }
    }
}