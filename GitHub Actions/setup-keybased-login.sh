# Generate SSH key pair on the local machine - ssh-keygen -t rsa -b 4096
# Find the private key and public keys inside ~./ssh folder (e.g. ~./ssh/id_rsa & ~./ssh/id_rsa.pub)
# Copy the public key (e.g. id_rsa.pub) to remote host - ssh-copy-id root@192.168.4.10
# Note: Public key will be available inside ~/.ssh/authorized_keys on remote machine
# [****OPTIONAL****] - Disable password authentication inside /etc/ssh/sshd_config on the remote machine 
#    1. nano /etc/ssh/sshd_config
#    1.1. #PasswordAuthentication no -> PasswordAuthentication no
# Change the permissions of ~/.ssh and ~/.ssh/authorized_keys on remote machine
# After changing the value, restart the SSH service on remote host - systemctl restart ssh

#!/bin/bash
REMOTE_USERNAME="ec2-user"
REMOTE_HOST="192.168.4.10"

ssh-keygen -t rsa -b 4096
ssh-copy-id $REMOTE_USERNAME@$REMOTE_HOST

ssh $REMOTE_USERNAME@$REMOTE_HOST "chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys"
ssh $REMOTE_USERNAME@$REMOTE_HOST "sudo sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/' /etc/ssh/sshd_config; systemctl restart ssh"


