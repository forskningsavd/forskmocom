## About

Forskmocom is a development environment for [OsmocomBB](http://bb.osmocom.org) which uses [Vagrant](http://vagrantup.com/) to create a virtual machine where all dependencies are installed and set up. The goal is to facilitate using and developing OsmocomBB.

This environment should work equally well on Windows, Linux and OS X. The virtual machine is a Ubuntu image based on the [forskbox](https://github.com/forskningsavd/forskbox).

## Getting started

### Prerequisites

* [git](http://git-scm.com/)
* [Vagrant](http://vagrantup.com/)

### Get the source

    git clone git@github.com:forskningsavd/forskmocom.git
    cd forskmocom
    git submodule init
    git submodule update

### Set up virtual machine

    vagrant up

### Enable USB in VirtualBox

    vagrant halt

Launch VirtualBox and edit the settings for the `forskmocom_*` virtual machine to [enable USB](http://www.virtualbox.org/manual/ch03.html#idp11188688).

    vagrant up

### Build OsmocomBB

    vagrant ssh
    cd /vagrant/osmobom-bb/src
    make

### Run `hello_world`

Remove the battery and put it back, connect the phone to your computer with an appropriate [cable](http://bb.osmocom.org/trac/wiki/Hardware/SerialCable). Upload `hello_world` to the phone (`c123xor` and `compal_e88` depends on your phone model):

    osmocon -p /dev/ttyUSB0 -m c123xor \
        -c target/firmware/board/compal_e88/hello_world.highram.bin \
        target/firmware/board/compal_e88/chainload.compalram.bin

Press the power-on button on the phone briefly to start the actual upload. If everything works you should get a flashing `Hello World` on the phone.

## Troubleshooting

### `Cannot open serial device /dev/ttyUSB0` when running `osmocon`

You haven't [enabled USB](http://www.virtualbox.org/manual/ch03.html#idp11188688) in VirtualBox or you haven't connected the USB cable.

## TODO

* Wrapper for `osmocon` to enable specifying target phone  once, and reducing some arguments
