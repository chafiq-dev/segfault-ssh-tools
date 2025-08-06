#!/bin/sh
#
# This script launches a private shell session on the segfault server with
# command history disabled.
#
# Use this for sensitive tasks where you don't want commands logged.

echo "Launching a quiet shell on segfault.net..."
echo "Command history is disabled for this session."
ssh artefactgrass "bash --norc --noprofile" -c "unset HISTFILE; exec bash"
