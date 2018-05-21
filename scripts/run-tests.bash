#!/bin/bash

TESTS_DIR="tests"
BINARY_PATH="../build/Products/IPA/TravisBrowserstack.ipa"

cd $TESTS_DIR

node app.js -u $BROWSERSTACK_USER -p $BROWSERSTACK_PASS -f $BINARY_PATH

cd ..