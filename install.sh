#!/bin/bash

mkdir -p ~/.gnupg
cp gpg.conf gpg-agent.conf ~/.gnupg

# Get the public key from 1Password CLI.
publicKey=$(op get item gpg-public --fields notesPlain)

# Check if the key has been imported into GnuPG.
isKeyImported=$(gpg --list-keys | grep FA34106C0F39E8FE6746B20A620EE9507EBB0399)

# Import the keys if they are available but haven't been imported.
if [[ $publicKey != '' && $isKeyImported == '' ]]; then

  # Import the public key from 1Password CLI into GnuPG.
  gpg --import $publicKey

  # Import the private key from 1Password CLI into GnuPG.
  op get item gpg-private --fields notesPlain | gpg --allow-secret-key-import --import

fi

if [[ $? == 0 ]]; then
  printf "\n✅ Installed GPG configuration successfully.\n"
fi
