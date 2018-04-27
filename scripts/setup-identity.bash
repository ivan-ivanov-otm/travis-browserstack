#!/bin/bash


#decrypt
openssl aes-256-cbc -k "$dev_ssl" -in ./scripts/signing/dev_key.enc -d -a -out scripts/certs/dev_key.cer
openssl aes-256-cbc -k "$dev_ssl" -in ./scripts/signing/dev_provisioning.enc -d -a -out scripts/certs/dev_provisioning.mobileprovision

#create custom keychain
security create-keychain -p $dev_keypass ios-build.keychain
security default-keychain -s ios-build.keychain
security unlock-keychain -p $dev_keypass ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain

#import certificates
security import ./scripts/signing/AppleWWDRCA.cer -k ios-build.keychain -A
security import ./scripts/signing/dev_key.cer.cer -k ios-build.keychain -A

# Fix for OS X Sierra that hungs in the codesign step
#security set-key-partition-list -S apple-tool:,apple: -s -k $SECURITY_PASSWORD ios-build.keychain > /dev/null

#import provisioning profile
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/certs/dev_provisioning.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/