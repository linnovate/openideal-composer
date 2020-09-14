#!/usr/bin/env bash

# Helpers: color patterns.
RED='\033[0;31m'
NC='\033[0m'

message="\n ${RED}[ERROR] Push failed.${NC}\n   The branch name isn't valid.\n   Valid branch name pattern is 'OI-000-short-description'.\n\n"

while read localname localhash remotename remotehash; do
    # We should validate only branches. Tags and other stuff should be ignored.
    if [[ $localname != *"refs/heads/"* ]]; then
      continue
    fi

    if [[ ! $localname =~ ^refs/heads/OI-[0-9]{1,4}-.*$ ]]; then
      printf "$message"
      exit 1
    fi
done
