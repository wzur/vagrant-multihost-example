#!/bin/sh -eu
ansible-playbook -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ${1+"$@"}
