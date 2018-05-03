#!/bin/bash

security delete-keychain $CUSTOM_KEYCHAIN -p "$CUSTOM_CHAIN_PASS"

echo "Should have deleted custom keychain. Current keychains:"

security list-keychains