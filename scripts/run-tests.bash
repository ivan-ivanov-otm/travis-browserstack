#!/bin/bash

TESTS_DIR=$1
BINARY_PATH=$2

cd $TESTS_DIR

node app.js -u $BROWSERSTACK_USER -p $BROWSERSTACK_PASS -f $BINARY_PATH

cd ..