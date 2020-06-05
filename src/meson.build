deps = [
  math,
  gio,
  glib,
  glib_json,
  gtk,
  gee,
  libhandy,
]

sources = [
  'Application.vala',
  'CharacterSheet.vala',
  'CharacterFeat.vala',
  'CharacterAttack.vala',
  'Util.vala',
  'ui/AppWindow.vala',
  'ui/ShortcutsWindow.vala',
  'ui/CharacterInfoPage.vala',
  'ui/CharacterSkillsPage.vala',
  'ui/CharacterInventoryPage.vala',
  'ui/EntryRow.vala',
  'ui/ComboBoxRow.vala',
  'ui/SpinButtonRow.vala',
  'ui/SpinButtonCheckboxRow.vala',
  'ui/SeparatorRow.vala',
  'ui/CharacterFeatRow.vala',
  'ui/CharacterAttackRow.vala',
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