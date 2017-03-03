# makerware snap package
===========================

"makerware" is a software to control MakerBot 3D printers and
to slice 3D models. However makerware can only be run on Xenial
and Trusty. Also to install makerware on Xenial it
requires you to replace the python to a customize one which
might taint the system. Now Ubuntu provides a new packaging format
called snap which can pack all its dependencies inside.
And it runs on a squashfs which is isolated
to the system rootfs. Also snap packages can be used on many
other distros including Debian.

This document describes how to make a snap package for makerware.
However, we cannot re-distribute the snap package to you because of
the proprietary license of makerware so please make the snap package
by yourself.

## Create a pbuilder environment of Xenial.

Because we want to install some 3rd party PPA and makerbot apt source and
we don't want to taint your system, please create a pbuilder
environment for Xenial at first by the following steps:

 1. Create xenial chroot environment
    ~~~
    pbuilder-dist xenial create
    ~~~

Note: pbuilder-dist is in ubuntu-dev-tools package. Please install it first.
    ~~~
    sudo apt install ubuntu-dev-tools
    ~~~

## Building the snap package inside the chroot environment.

 1. Make an empty directory in /tmp
    ~~~
    mkdir /tmp/p1
    ~~~
 
 2. Login into the chroot environment. Also bindmounts /tmp/p1 so that
    directory is shared between chroot and the outside system.
    ~~~
    pbuilder-dist xenial login --bindmounts /tmp/p1
    ~~~

 3. Install some packages
    ~~~
    apt-get install git snapcraft
    ~~~

 4. Move to the tmp directory
    ~~~
    cd /tmp/p1
    ~~~

 5. Download our source
    ~~~
    git clone https://github.com/grandpaul/makerware-snap.git
    ~~~
    
 6. Go into the project directory
    ~~~
    cd makerware-snap
    ~~~

 7. Install makerware apt repo and some PPA for the dependencies. This is
    actually the steps of
    [official page](https://support.makerbot.com/learn/makerbot-desktop-software/installation-and-setup/how-to-install-makerbot-desktop-for-linux_11262)
    ~~~
    ./prepare_in_xenial_chroot.sh  # this is actually
    ~~~

 8. Run snapcraft
    ~~~
    snapcraft
    ~~~

Now you have your snap package generated in /tmp/p1/makerware-snap

## Install and use.

 * Install snapd on your host system to be able to use snap packages.
    ~~~
    sudo apt install snapd
    ~~~

 * To install the snap package. Please use the following command:
    ~~~
    sudo snap install --dangerous makerware_3.9.1_amd64.snap
    ~~~

 * To run makerware, please use the command:
    ~~~
    snap run makerware
    ~~~

 * To run digitizer, please use the command:
    ~~~
    snap run makerware.digitizer
    ~~~
