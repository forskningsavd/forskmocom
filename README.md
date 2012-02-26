## About

Forskmocom is a development environment for [OsmocomBB](http://bb.osmocom.org) which uses [Vagrant](http://vagrantup.com/) to create a virtual machine where all dependencies are installed and set up. The goal is to facilitate using and developing OsmocomBB.

This environment should work equally well on Windows, Linux and OS X. The virtual machine is a Ubuntu image.

## Getting started

**Prerequisites:** [git](http://git-scm.com/), [Vagrant](http://vagrantup.com/).

**Get the source:**

    git clone git@github.com:forskningsavd/forskmocom.git
    cd forskmocom
    git submodule init
    git submodule update

**Set up virtual machine:**

    vagrant up

**Enable USB in VirtualBox:**

    vagrant halt

Launch VirtualBox and edit the settings for the `forskmocom_*` virtual machine to [add USB](http://www.virtualbox.org/manual/ch03.html#idp11188688).

    vagrant up

**Build OsmocomBB:**

    vagrant ssh
    cd /vagrant/osmobom-bb/src
    make

***TODO*** 'hello world' of `osmocon`
