#!/bin/bash

FILE_PATH="./build/Products/IPA/TravisBrowserstack.ipa"
UPLOAD_PATH="https://api-cloud.browserstack.com/app-automate/upload"
CONFIG_FILE_PATH="./scripts/app_url.json"

curl -u "$BROWSERSTACK_USER:$BROWSERSTACK_PASS" -X POST $UPLOAD_PATH -F "file=@$FILE_PATH" -o CONFIG_FILE_PATH

cat CONFIG_FILE_PATH