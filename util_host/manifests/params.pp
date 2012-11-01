class util_host::params {

  #minor packages that don't deserve their own module
  $misc_packages = [
    'nc',
    'tree',
    'tcpdump',
    'vim-enhanced',
    'nmap',
  ]

  #features (classes/modules) that will be included
  $features = [
    'git', #git client
    'rcfiles', #system wide rc files (vimrc, etc)
    'networking', # static network configuration
  ]
}
