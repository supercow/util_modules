class dnsmasq(
  $puppet_dns_svr1 = '192.168.100.8',
  $puppet_dns_svr2 = '192.168.100.7',
) {

  package { 'dnsmasq':
    ensure => present,
  }

  file { '/etc/dnsmasq.conf':
    ensure  => 'file',
    content => template('dnsmasq/dnsmasq.conf.erb'),
    group   => 'root',
    mode    => '644',
    owner   => 'root',
    require => Package['dnsmasq'],
  }

  service { 'dnsmasq':
    ensure    => 'running',
    enable    => 'true',
    subscribe => [File['/etc/dnsmasq.conf'],Package['dnsmasq']],
  }
}
