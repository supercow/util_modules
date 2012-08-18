class rcfiles::vim {

  include rcfiles::params

  file { $rcfiles::params::vimfiles_path:
    ensure  => directory,
    source  => "puppet:///modules/${module_name}/vim",
    recurse => remote,
    force   => true,
  }

  file { $rcfiles::params::vimrc_path:
    ensure => file,
    source => "puppet:///modules/${module_name}/vimrc",
  }
}
