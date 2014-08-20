# linux-desktop-ansible

My Ansible configuration for a Linux Mint Desktop

## Setup Base Linux Mint 17 Cinnamon System

In VMWare Fusion, Pick Linux > Ubuntu with LinuxMint 17 ISO

Choose "Customize Settings" button:

        Set Memory to something bigger than default

Boot into Linux.

Double-click on "Install Linux Mint" DVD image on Desktop to install.

* During install steps, you may want to choose the option to encrypt your hard-drive, or when you create your user you can choose to encrypt just your home folder.

Restart when prompted.

Install VMWare Tools via menu:

* Extract file, then run install script. Accept all default parameters.

* Restart virtual machine

In Menu > System Settings:

* Choose `Themes` and pick Cinnamon. Then pick a nice background image.

## Ansible Setup

Setup local ssh key:

        ssh-keygen -t rsa

Upload public key (`~/.ssh/id_rsa.pub`) to Github to clone repos.

Bootstrap system with:

        cd ~
        wget https://raw.githubusercontent.com/briangershon/linux-desktop-ansible/master/install.sh
        chmod u+x install.sh
        ./install.sh

Add your secret Ansible Vault password which should never be checked into source control:

        vim ~/workspace/linux-desktop-private/vaultpass.txt
        sudo chmod 600 ~/workspace/linux-desktop-private/vaultpass.txt

It's just a one-line text file with a password in it, so you don't have to re-enter password each time you run Ansible.

Then you can encrypt a file of secrets and include that with `include_vars` to feed your templates.

To run `ansible-vault` commands, call the `./ansible-vault` script in `~/workspace/linux-desktop-ansible`. e.g. `ansible-vault edit <file>`

## Run Ansible for Realz

        cd ~/workspace/linux-desktop-ansible

        # if running for first time use which runs with "ask sudo password" option
        ./up-first-time.sh

        # on subsequent times, use this (since we've added our user to sudo and don't need to prompt anymore)
        ./up.sh

## VMWare Fusion OSX Key Mappings for Linux Mint (Ubuntu)

These are mappings in VMWare Fusion Preferences > Keyboard & Mouse.

I started with using "Default" profile (not Mac profile), then added in these key mappings:

To support Apple-Tab to move between applications:

* I wasn't able to get this to work via enabling Apple-T and changing mapping to Ctrl-Alt-Tab. Even after also turning off "Enable Mac OS Host Shortcuts".

* Though `Option-Tab` by default does the equivalent. And still allows you to use the Mac OS Host shortcuts.

Map `Apple` to `Ctrl` to support Apple-[ and Apple-] for outdenting/indenting in Atom editor.

To support Atom editor (and begin/end line in Terminal) move to home/end of line and disable Cinnamon "Push Tile Left/Right"

* `Apple-Right` -> `End`
* `Apple-Left` -> `Home`
* `Shift-Apple-Left` -> `Shift-Home`    # supports select to beginning of line
* `Shift-Apple-Right` -> `Shift-End`    # supports select to end of a line

I discovered that Apple key by itself will bring up Mint Menu.

## Inspiration

* Concept of running Ansible locally for installing desktop machines and some nice recipes: <http://www.compoundtheory.com/provision-your-local-machines/> and `install.sh` and `up.sh`

* Ansible desktop recipes: <https://github.com/kalos/ansible-desktop>
