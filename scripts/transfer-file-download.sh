#!/bin/sh
#
# This script downloads a file from the segfault server using base64 encoding.
#
# Usage: sh transfer-file-download.sh <remote_path> <local_file>
# Example: sh transfer-file-download.sh /sec/report.txt report.txt

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: sh $0 <remote_path> <local_file>"
    exit 1
fi

REMOTE_PATH=$1
LOCAL_FILE=$2

echo "Downloading '$REMOTE_PATH' from segfault to '$LOCAL_FILE'..."
ssh artefactgrass "base64 $REMOTE_PATH" | base64 -d > "$LOCAL_FILE"

echo "Download complete."
