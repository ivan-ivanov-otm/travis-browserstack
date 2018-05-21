#!/bin/bash

APP_ENTRY="$HOME/tests/app.js"
BINARY_PATH="./build/Products/IPA/TravisBrowserstack.ipa"

echo $APP_ENTRY
echo $BINARY_PATH
echo $BROWSERSTACK_USER
echo $BROWSERSTACK_PASS

node $APP_ENTRY -u $BROWSERSTACK_USER -p $BROWSERSTACK_PASS -f $BINARY_PATH