namespace DungeonJournal
{ 
    public class App : Gtk.Application
    {
        public static Window window;

        public App()
        {
            Object(
                application_id: "io.github.trytonvanmeer.DungeonJournal",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void startup()
        {
            base.startup();
            setup_actions();
        }

        protected override void activate()
        {
            window = new DungeonJournal.Window(this);
            window.show_all();
        }

        private void setup_actions()
        {
            var about_action = new GLib.SimpleAction("about", null);
            about_action.activate.connect(() =>
            {
                show_about_dialog();
            });

            this.add_action(about_action);
        }

        private void show_about_dialog()
        {
            string[] authors =
            {
                "Tryton Van Meer <trytonvanmeer@gmail.com>",
            };

            Gtk.show_about_dialog
            (
                window,
                logo_icon_name: "com.github.trytonvanmeer.DungeonJournal",
                program_name: "Dungeon Journal",
                comments: _("Create Characters"),
                copyright: "© 2019 Tryton Van Meer",
                authors: authors,
                website: "https://github.com/tryton-vanmeer/DungeonJournal",
                website_label: _("GitHub Homepage"),
                version: Config.VERSION,
                license_type: Gtk.License.GPL_3_0
            );
        }
    }

    public static int main(string[] args)
    {
        // Setup gettext
        Intl.bindtextdomain(Config.GETTEXT_PACKAGE, Config.GNOMELOCALEDIR);
        Intl.setlocale(LocaleCategory.ALL, "");
        Intl.textdomain(Config.GETTEXT_PACKAGE);
        Intl.bind_textdomain_codeset(Config.GETTEXT_PACKAGE, "utf-8");

        Gtk.init(ref args);
        Hdy.init (ref args);

        var app = new App();

        return app.run(args);
    }
}
