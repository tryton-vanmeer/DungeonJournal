deps = [
  math,
  gio,
  glib,
  glib_json,
  gtk,
  libhandy,
]

sources = [
  'Application.vala',
  'Window.vala',
  'ShortcutsWindow.vala',
  'CharacterInfoPage.vala',
  'CharacterSkillsPage.vala',
  'CharacterSheet.vala',
  'Util.vala',
  'widget/EntryRow.vala',
  'widget/ComboBoxRow.vala',
  'widget/SpinButtonRow.vala',
  'widget/SpinButtonCheckboxRow.vala',
]

c_args = [
  '-include', 'config.h',
  '-DHANDY_USE_UNSTABLE_API',
  '-DLOCALEDIR="@0@"'.format(locale_dir),
]

executable(
    meson.project_name(),
    sources + resources,
    include_directories: config_h_dir,
    dependencies: deps,
    c_args: c_args,
    install: true,
)