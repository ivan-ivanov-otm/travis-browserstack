#!/bin/bash

CUSTOM_KEYCHAIN=ios-build
CUSTOM_KEYCHAIN_PATH=~/Library/Keychains/$CUSTOM_KEYCHAIN

security delete-keychain $CUSTOM_KEYCHAIN_PATH

echo "Should have deleted custom keychain. Current keychains:"

security list-keychains