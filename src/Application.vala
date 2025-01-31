using Gtk;

namespace DungeonJournal
{
    public class App : Adw.Application
    {
        public static DungeonJournal.Settings settings;
        public DungeonJournal.ApplicationWindow window;

        public App()
        {
            Object(
                application_id: Config.APP_ID,
                flags: ApplicationFlags.FLAGS_NONE
            );

            settings = new DungeonJournal.Settings();
        }

        protected override void startup()
        {
            base.startup();
            setup_actions();
        }

        protected override void activate()
        {
            this.window = new DungeonJournal.ApplicationWindow(this);
        }

        private void setup_actions()
        {
            var about_action = new GLib.SimpleAction("about", null);
            about_action.activate.connect(() =>
            {
                show_about_dialog();
            });

            var open_action = new GLib.SimpleAction("open", null);
            open_action.activate.connect(()=>
            {
                this.window.on_open.begin();
            });

            var save_action = new GLib.SimpleAction("save", null);
            save_action.activate.connect(() =>
            {
                this.window.on_save();
            });

            var save_as_action = new GLib.SimpleAction("save_as", null);
            save_as_action.activate.connect(() =>
            {
                this.window.on_save_as.begin();
            });

            this.add_action(open_action);
            this.add_action(save_action);
            this.add_action(about_action);
            this.add_action(save_as_action);

            // Setup Accelerators
            set_accels_for_action("app.open", {"<Primary>o"});
            set_accels_for_action("app.save", {"<Primary>s"});
            set_accels_for_action("app.save_as", {"<Primary><Shift>S"});
        }

        private void show_about_dialog()
        {
            string[] authors =
            {
                "Tryton Van Meer <trytonvanmeer@gmail.com>",
                "qwertzuiopy <michael@cmbm.de>",
                "Azakidev <zazaguichi@outlook.com>"
            };

            var version = Config.VERSION;

            if (Config.PROFILE == "development")
            {
                version = "master";
            }

            Adw.show_about_dialog
            (
                window,
                application_icon: Config.APP_ID,
                application_name: "Dungeon Journal",
                comments: _("Create Characters"),
                copyright: "© 2019 Tryton Van Meer",
                developers: authors,
                website: "https://github.com/tryton-vanmeer/DungeonJournal",
                version: version,
                license_type: Gtk.License.GPL_3_0
            );
        }
    }

    public static int main(string[] args)
    {
        // Setup gettext
        Intl.bindtextdomain(Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
        Intl.setlocale(LocaleCategory.ALL, "");
        Intl.textdomain(Config.GETTEXT_PACKAGE);
        Intl.bind_textdomain_codeset(Config.GETTEXT_PACKAGE, "utf-8");

        Gtk.init();

        var app = new App();

        return app.run(args);
    }
}
