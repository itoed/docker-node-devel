#!/bin/bash

set -e

ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_dsa_key -N ""
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

su -c "npm install --prefix /home/developer/app" - developer

touch /supervisord.log
chown developer:developer /supervisord.log
exec supervisord
