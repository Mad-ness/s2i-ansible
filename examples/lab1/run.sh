#!/bin/bash

ls -l /privkeys

ls -l /etc/ansible

cat /privkeys/id_rsa

ansible-playbook --private-key /privkeys/id_rsa  site.yaml -vvv

