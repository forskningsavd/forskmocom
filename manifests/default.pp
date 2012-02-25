class base {
  group { 'puppet':
    ensure => present,
  }
  exec { '/usr/bin/apt-get update':
    alias => "aptgetupdate",
  }
  package { ['libtool', 'shtool', 'autoconf', 'git-core', 'pkg-config', 'make', 'gcc', # osmocom deps
             'python-software-properties']:
    ensure => latest,
    require => Exec['aptgetupdate'],
  }
  exec { '/usr/bin/add-apt-repository --yes ppa:bdrung/bsprak && /usr/bin/apt-get update':
    alias => 'addgnuarmrepo',
    require => Exec['aptgetupdate'],
  }
  package { ['arm-elf-toolchain']:
    ensure => latest,
    require => Exec['addgnuarmrepo'],
  }
}

include base
