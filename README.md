# linux-desktop-ansible

My Ansible configuration for a Linux Mint Desktop

## Setup Base Linux Mint 17 Cinnamon System

In VMWare Fusion, Pick Linux > Ubuntu with LinuxMint 17 ISO

Choose "Customize Settings" button:

        Set Memory to something bigger than default

Boot into Linux.

Double-click on "Install Linux Mint" DVD image on Desktop to install.

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

Add your secret Ansible Vault password which should never be checked into source control:

        vim ~/workspace/linux-desktop-private/vaultpass.txt
        sudo chmod 600 ~/workspace/linux-desktop-private/vaultpass.txt

It's just a one-line text file with a password in it, so you don't have to re-enter password each time you run Ansible.

Then you can encrypt a file of secrets and include that with `include_vars` to feed your templates.

To run `ansible-vault` commands, call the `./ansible-vault` script in `~/workspace/linux-desktop-ansible`.

## Run Ansible for Realz

        cd ~/workspace/linux-desktop-ansible

        # if running for first time use which runs with "ask sudo password" option
        ./up-first-time.sh

        # on subsequent times, use this (since we've added our user to sudo and don't need to prompt anymore)
        ./up.sh

## Inspiration

* Concept of running Ansible locally for installing desktop machines and some nice recipes: <http://www.compoundtheory.com/provision-your-local-machines/> and `install.sh` and `up.sh`

* Ansible desktop recipes: <https://github.com/kalos/ansible-desktop>
