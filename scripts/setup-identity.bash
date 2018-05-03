#!/bin/bash

###Constants###
ENCRYPTED_DEV_CERT=./scripts/signing/dev_cert.enc
DECRYPTED_DEV_CERT=./scripts/signing/dev_cert.p12
ENCRYPTED_PROVISIONING=./scripts/signing/prov.enc 
DECRYPTED_PROVISIONING=./scripts/signing/dev_provisioning.mobileprovision

APPLE_CERT=./scripts/signing/AppleWWDRCA.cer

PROVISIONING_PROFILES=~/Library/MobileDevice/Provisioning\ Profiles/
CUSTOM_KEYCHAIN=ios-build
CUSTOM_KEYCHAIN_PATH=~/Library/Keychains/$CUSTOM_KEYCHAIN
###############


#decrypt cert and provisioning profile
openssl aes-256-cbc -k $SSL -d -in $ENCRYPTED_DEV_CERT -out $DECRYPTED_DEV_CERT
openssl aes-256-cbc -k $SSL -d -in $ENCRYPTED_PROVISIONING -out $DECRYPTED_PROVISIONING


#create custom keychain
security create-keychain -p "$CUSTOM_CHAIN_PASS" $CUSTOM_KEYCHAIN
security default-keychain -s $CUSTOM_KEYCHAIN
security unlock-keychain -p "$CUSTOM_CHAIN_PASS" $CUSTOM_KEYCHAIN
security set-keychain-settings -t 3600 -l $CUSTOM_KEYCHAIN_PATH


# #import certificates into custom keychain
security import $APPLE_CERT -k $CUSTOM_KEYCHAIN -A
security import $DECRYPTED_DEV_CERT -k $CUSTOM_KEYCHAIN -A -P "$KEYPASS"

# Fix for OS X Sierra that hungs in the codesign step
#security set-key-partition-list -S apple-tool:,apple: -s -k $SECURITY_PASSWORD $CUSTOM_KEYCHAIN > /dev/null

#import provisioning profile
mkdir -p $PROVISIONING_PROFILES
cp $DECRYPTED_PROVISIONING $PROVISIONING_PROFILES