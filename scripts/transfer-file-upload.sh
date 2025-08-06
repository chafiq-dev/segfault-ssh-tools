#!/bin/sh
#
# This script uploads a local file to the segfault server using base64 encoding.
# It's a useful alternative when scp is slow or unavailable.
#
# Usage: sh transfer-file-upload.sh <local_file> <remote_path>
# Example: sh transfer-file-upload.sh my_script.py /sec/my_script.py

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: sh $0 <local_file> <remote_path>"
    exit 1
fi

LOCAL_FILE=$1
REMOTE_PATH=$2

if [ ! -f "$LOCAL_FILE" ]; then
    echo "Error: Local file '$LOCAL_FILE' not found."
    exit 1
fi

echo "Uploading '$LOCAL_FILE' to '$REMOTE_PATH' on segfault..."
ssh artefactgrass "cat > $REMOTE_PATH" < <(base64 "$LOCAL_FILE")

echo "Upload complete."
