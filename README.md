# linux-desktop-ansible

My Ansible configuration for a Linux Mint Desktop

## Setup Base Linux Mint 17 Cinnamon System

In VMWare Fusion, Pick Linux > Ubuntu with LinuxMint 17 ISO

Choose "Customize Settings" button:

        Network Adapter: Use the "Private to Mac" setting
        Memory: Set at 8192
        Hard Drive: Leave at 40 GB

Double-click on "Install Linux Mint" DVD image to install.

Install VMWare Tools via menu.  Extract file, then run install script.

        $ sudo reboot now

Settings > Themes: Pick Cinnamon Theme.

## Ansible Setup

Setup local ssh key and upload public key to Github:

        ssh-keygen -t rsa

Bootstrap:

        cd ~
        wget https://raw.githubusercontent.com/briangershon/linux-desktop-ansible/master/install.sh
        ~/install.sh

## Run Ansible for Realz

        cd ~/workspace/linux-desktop-ansible

        # if running for first time use which runs with "ask sudo password" option
        ./up-first-time.sh

        # on subsequent times, use this (since we've added our user to sudo and don't need to prompt anymore)
        ./up.sh

## Inspiration

* Concept of running Ansible locally for installing desktop machines and some nice recipes: <http://www.compoundtheory.com/provision-your-local-machines/> and `install.sh` and `up.sh`

* Ansible desktop recipes: <https://github.com/kalos/ansible-desktop>

