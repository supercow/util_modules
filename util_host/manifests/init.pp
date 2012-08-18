class util_host(
  $user = 'root',
  $user_home = '/root',
) {
  include util_host::params

  File {
    owner => $user,
    group => $user,
    mode  => '0644',
  }

  package { $util_host::params::misc_packages:
    ensure => present,
  }

  class {$util_host::params::features: }

  file { "${user_home}/src":
    ensure => directory,
  }

}
