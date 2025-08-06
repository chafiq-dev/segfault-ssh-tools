#!/bin/sh
#
# This script connects to a pre-configured segfault server instance
# using a simplified alias.
#
# NOTE: This will only work if you have completed the initial connection
# and have configured your ~/.ssh/config file with the 'artefactgrass' alias.

echo "Connecting to your pre-configured segfault server..."
ssh artefactgrass
