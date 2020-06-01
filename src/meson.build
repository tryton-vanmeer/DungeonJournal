vapi_dir = join_paths (meson.source_root (), 'src', 'vapis')

deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('json-glib-1.0', version: '>= 0.29.2'),
  dependency('libhandy-1', version: '>= 0.80.0'),
  valac.find_library('config', dirs: vapi_dir),
  cc.find_library('m'),
]

sources = [
  'Application.vala',
  'Window.vala',
  'ShortcutsWindow.vala',
  'CharacterInfoPage.vala',
  'CharacterSheet.vala',
  'Util.vala',
  'widget/EntryRow.vala',
  'widget/ComboBoxRow.vala'
]

c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="dungeonjournal"',
  '-DGNOMELOCALEDIR="' + get_option('prefix') + '/' + get_option('localedir') + '"',
  '-DHANDY_USE_UNSTABLE_API',
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