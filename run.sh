#!/bin/bash

# install requirements to run playbook
sudo apt-get install aptitude python-pip python3-pip git software-properties-common;

# Install ansible
# add ansible repo, only if it has not already been added
ansible_repos=( /etc/apt/sources.list.d/ansible-ubuntu-ansible-*.list )
if [[ ! ${#ansible_repos[@]} ]]; then
	sudo apt-add-repository ppa:ansible/ansible;
	sudo apt-get update;
fi
sudo apt-get install ansible;

# get full playbook repository
cd ~;
mkdir -p setup;
cd setup;
git clone https://github.com/steinad/provision-local.git;
cd provision-local;

# install python requirements for playbook
sudo pip install -r requirements.txt;
sudo pip2 install -r requirements.txt;

echo -e "Edit the config.json file, and [ENTER] when finished" && read

ansible-playbook setup.yml -i 127.0.0.1 --ask-become-pass --ask-vault-pass

exit 0
