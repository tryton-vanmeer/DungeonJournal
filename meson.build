project('dungeonjournal', ['c', 'vala'], 
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
  dependency('libhandy-0.0', version: '>= 0.0.9'),
  valac.find_library('config', dirs: vapi_dir),
]

sources = [
  'src/Application.vala',
  'src/Window.vala',
  'src/View/CharacterInfoView.vala',
  'src/View/CharacterStatsView.vala',
  'src/View/CharacterAbilitySkillView.vala',
  'src/Widget/CharacterEntry.vala',
  'src/Widget/AbilityScore.vala',
  'src/Widget/AbilitySkill.vala',
  'src/Util.vala',
]

c_args = [
  '-DVERSION="' + meson.project_version() + '"',
  '-DGETTEXT_PACKAGE="footnote"',
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

meson.add_install_script('meson_post_install.py')
