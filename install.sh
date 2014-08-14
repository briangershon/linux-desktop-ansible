#!/bin/sh
sudo apt-get install git python python-yaml python-jinja2 aptitude
cd ~
mkdir workspace
cd workspace
git clone git@github.com:briangershon/linux-desktop-ansible.git
git clone git@github.com:briangershon/linux-desktop-private.git

