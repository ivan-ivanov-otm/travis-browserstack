#!/bin/bash

APP_ENTRY="$HOME/tests/app.js"
BINARY_PATH="./build/Products/IPA/TravisBrowserstack.ipa"

node $APP_ENTRY -u $BROWSERSTACK_USER -p $BROWSERSTACK_PASS -f $BINARY_PATH