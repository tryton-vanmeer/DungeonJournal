project('dungeonjournal', ['c', 'vala'],
        version: '0.7.0',
  meson_version: '>= 0.49.0',
)

gnome = import('gnome')
i18n = import('i18n')

# Add custom VAPI dir
add_project_arguments(
  ['--vapidir', meson.source_root() / 'vapi'],
  language: 'vala'
)

# Application ID
if get_option('profile') == 'development'
  app_id = 'io.github.trytonvanmeer.DungeonJournal.Devel'
else
  app_id = 'io.github.trytonvanmeer.DungeonJournal'
endif


# Dependencies
add_project_arguments(
  '--target-glib=2.50',
  language: 'vala'
)

math = meson.get_compiler('c').find_library('m')

gio = dependency('gio-2.0', version: '>= 2.50')
glib = dependency('glib-2.0', version: '>= 2.50')
glib_json = dependency('json-glib-1.0', version: '>= 0.29.2')
gtk = dependency('gtk4', version: '>= 4')
libadwaita = dependency('libadwaita-1', version: '>= 1.4')
gee = dependency('gee-0.8')

# Configuration
config_h_dir = include_directories('.')
locale_dir = get_option('prefix') / get_option('localedir')

conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('PROFILE', get_option('profile'))
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('LOCALEDIR', locale_dir)
configure_file(output: 'config.h', configuration: conf)

add_project_arguments(
  ['--pkg', 'config'],
  language: 'vala'
)

valac = meson.get_compiler('vala')
cc = meson.get_compiler('c')

# Post-install scripts
meson.add_install_script('build-aux/meson_post_install.py')

# Subfolders
subdir('data')
subdir('po')
subdir('src')
