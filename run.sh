#!/bin/bash

# install requirements to run playbook
sudo apt-get install python3-pip python-pip git software-properties-common

# install ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

# get full playbook repository
cd ~
mkdir -p setup
cd setup
git clone https://github.com/steinad/provision-local.git
cd provision-local

# install python requirements for playbook
sudo pip install -r requirements.txt

echo -e "Edit the config.json file, and [ENTER] when finished" && read

ansible-playbook setup.yml -i 127.0.0.1 --ask-become-pass --ask-vault-pass

exit 0
