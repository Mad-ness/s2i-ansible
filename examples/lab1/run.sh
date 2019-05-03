#!/bin/bash

ansible-playbook --private-key=/etc/ansible/privkeys/id_rsa  site.yaml -vvv

exit 0

