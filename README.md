# Dungeon Journal

![screenshot](data/screenshots/1.png)

Dungeon Journal is a 5e character manager for the GNOME desktop environment.

## Install
Make sure you have Flatpak installed. [Get more information](http://flatpak.org/getting.html)

<a href='https://flathub.org/apps/details/io.github.trytonvanmeer.DungeonJournal'><img width='240' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-en.png'/></a>

## Building
Dungeon Journal can be built and run with [Gnome Builder](https://wiki.gnome.org/Apps/Builder) >= 3.28.
Just clone the repo and hit the run button!
You can get Builder from [here](https://wiki.gnome.org/Apps/Builder/Downloads).

You also can build Dungeon Journal manually without using Flatpak:

```
git clone https://github.com/tryton-vanmeer/DungeonJournal.git
cd DungeonJournal
mkdir build
cd build
meson ..
ninja
```

**Note:** Additional to the standard dependencies (GTK, Vala, ...), you need following dependencies:
- json-glib
- libhandy
