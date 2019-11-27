#!/bin/bash

mkdir -p ~/.gnupg
cp gpg.conf gpg-agent.conf ~/.gnupg

# Import the public key from Keybase.
keybase pgp export | gpg --import

# Import the private key from Keybase.
keybase pgp export -s | gpg --allow-secret-key-import --import

if [[ $? == 0 ]]; then
  printf "\n✅ Installed GPG configuration successfully.\n"
fi
