class base {
  group { 'puppet':
    ensure => present,
  }
  file { '/home/vagrant/.bashrc':
    content => 'export PATH=$PATH:/vagrant/bin',
    owner => 'vagrant',
    group => 'vagrant',
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
  file { '/home/vagrant/.osmocom':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
  }
  file { '/home/vagrant/.osmocom/bb':
    ensure => directory,
    owner => 'vagrant',
    group => 'vagrant',
  }
  file { '/home/vagrant/.osmocom/bb/mobile.cfg':
    ensure => link,
    target => '/vagrant/mobile.cfg',
    owner => 'vagrant',
    group => 'vagrant',
  }
}

include base
