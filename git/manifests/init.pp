class git {

  $hooks_dir = '/usr/share/git-core/templates/hooks'
  package { 'git':
   ensure => present,
  }

  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/gitconfig':
    source => "puppet:///modules/${module_name}/gitconfig",
  }

  file { '/usr/bin/git-completion.sh':
    source => "puppet:///modules/${module_name}/git-completion.sh",
    mode   => '0755',
  }

  file { '/etc/profile.d/git-completion.sh':
    content => 'source /usr/bin/git-completion.sh',
  }

  package { 'puppet-lint':
    ensure   => present,
    provider => 'gem',
  }

  file { "${hooks_dir}/pre-commit":
    source => "puppet:///modules/${module_name}/pre-commit",
    mode   => '0755',
  }
}
