#!/bin/bash

FILE_PATH="$BUILD_DIR$IPA_FILE_NAME"
UPLOAD_PATH="https://api-cloud.browserstack.com/app-automate/upload" 

curl -u "$BROWSERSTACK_USER:$BROWSERSTACK_PASS" -X POST $UPLOAD_PATH "file=@$FILE_PATH"