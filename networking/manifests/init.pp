class networking(
  $dhcp_enabled    = false,
  $network         = '172.16.199.0',
  $static_ip       = '172.16.199.254',
  $netmask         = '255.255.255.0',
  $default_gateway = '172.16.199.2',
  $domain          = 'fusion.local',
  $nameservers     = ['172.16.199.2'],
){

  File {
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  service { 'network':
    ensure => running,
    enable => true,
  }

  if ! $dhcp_enabled {
    file { '/etc/resolv.conf':
      content => template('networking/resolv.conf.erb'),
    }
  }

  file { '/etc/sysconfig/network':
    content => template('networking/sysconfig_network.erb'),
    notify  => Service['network'],
  }

  file { '/etc/sysconfig/network-scripts/ifcfg-eth0':
    content => template('networking/ifcfg-eth0.erb'),
    notify  => Service['network'],
  }

}
