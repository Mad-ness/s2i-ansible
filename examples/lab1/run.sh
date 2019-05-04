#!/bin/bash

ls -l /privkeys

ls -l /etc/ansible

ansible-playbook --private-key /privkeys/id_rsa  site.yaml -vvv

