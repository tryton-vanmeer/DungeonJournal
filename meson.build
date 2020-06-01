project('dungeonjournal', ['c', 'vala'],
        version: '0.6.0',
  meson_version: '>= 0.40.0',
)

i18n = import('i18n')
gnome = import('gnome')

valac = meson.get_compiler('vala')
cc = meson.get_compiler('c')

subdir('data')
subdir('po')
subdir('src')

meson.add_install_script('meson_post_install.py')
