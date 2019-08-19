project('roru', ['c', 'vala'], 
        version: '0.1.0',
  meson_version: '>= 0.40.0',
)

i18n = import('i18n')
gnome = import('gnome')

subdir('data')
subdir('po')

vapi_dir = join_paths (meson.source_root (), 'src', 'vapis')
valac = meson.get_compiler('vala')

deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  valac.find_library('config', dirs: vapi_dir),
]

sources = [
  'src/Application.vala',
  'src/Window.vala',
]

c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="footnote"',
  '-DGNOMELOCALEDIR="' + get_option('prefix') + '/' + get_option('localedir') + '"',
]

vala_args = [
  '--target-glib=2.50',
  '--vapidir', vapi_dir,
]

executable(
    meson.project_name(),
    sources + resources,
    dependencies: deps,
    vala_args: vala_args,
    c_args: c_args,
    install: true,
)

meson.add_install_script('meson_post_install.py')