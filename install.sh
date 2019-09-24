#!/bin/bash

mkdir -p ~/.gnupg
cp gpg.conf gpg-agent.conf ~/.gnupg

if [[ $? == 0 ]]; then
  printf "\n✅ Installed GPG configuration successfully.\n"
fi
