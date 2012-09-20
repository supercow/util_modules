# Class: util_host::envpuppet
#
#   Enables envpuppet for /root/src
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class util_host::envpuppet {
  $module = "envpuppet"
  file { '/etc/profile.d/envpuppet.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => "#!/bin/sh\nPATH=\$PATH:\$HOME/src/puppet/ext"
  }
}
