deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('json-glib-1.0', version: '>= 0.29.2'),
  dependency('libhandy-1', version: '>= 0.80.0'),
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
  'widget/ComboBoxRow.vala',
  'widget/SpinButtonRow.vala'
]

c_args = [
  '-include', 'config.h',
  '-DHANDY_USE_UNSTABLE_API',
  '-DLOCALEDIR="@0@"'.format(locale_dir),
]

vala_args = [
  '--target-glib=2.50',
]

executable(
    meson.project_name(),
    sources + resources,
    include_directories: config_h_dir,
    dependencies: deps,
    vala_args: vala_args,
    c_args: c_args,
    install: true,
)