#!/bin/bash

cp ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf .

if [[ $? == 0 ]]; then
  printf "\n✅ Updated gpg configuration successfully.\n"
fi
