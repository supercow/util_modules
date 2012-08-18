class util_host::params {

  #minor packages that don't deserve their own module
  $misc_packages = [
    'nc',
  ]

  #features (classes/modules) that will be included
  $features = [
    'git', #git client
    'rcfiles', #system wide rc files (vimrc, etc)
  ]
}
