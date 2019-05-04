#!/bin/bash

cat /privkeys/id_rsa > /tmp/id_rsa && chmod 0400 /tmp/id_rsa

ansible-playbook --private-key /tmp/id_rsa  site.yaml -vvv

