class dnsmasq(
  $puppet_dns_svr1 = '192.168.100.8',
  $puppet_dns_svr2 = '192.168.100.7',
) {

  package { 'dnsmasq':
    ensure => present,
  }

  File {
    ensure  => 'file',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    require => Package['dnsmasq'],
  }

  file { '/etc/dnsmasq.conf':
    content => template('dnsmasq/dnsmasq.conf.erb'),
  }

  file { '/etc/dnsmasq.resolv':
    content => template('dnsmasq/dnsmasq.resolv.erb'),
  }

  service { 'dnsmasq':
    ensure    => 'running',
    enable    => 'true',
    subscribe => [File['/etc/dnsmasq.conf'],Package['dnsmasq']],
  }
}
