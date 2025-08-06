#!/bin/sh
#
# This script performs the initial SSH connection to segfault.net.
# It is used to create a new temporary server instance.
#
# You will be prompted to confirm the host key and enter a password.
# After a successful connection, be sure to copy and run the configuration
# commands provided by the server to set up your ~/.ssh/config file.

echo "Connecting to segfault.net to create a new temporary server instance..."
ssh -L2900:0:2900 -L5900:0:5900 root@segfault.net
