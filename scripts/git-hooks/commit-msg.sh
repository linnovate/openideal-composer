#!/usr/bin/env bash

# Helpers: color patterns.
RED='\033[0;31m'
NC='\033[0m'

# Jira Issue is required. Other options (like #comment) are optional, but appreciated.
# More details: https://support.atlassian.com/jira-software-cloud/docs/process-issues-with-smart-commits

commit_regex='(OI-[0-9]+)'
message="\n ${RED}[ERROR] Aborting commit.${NC}\n   Please add Jira Issue to your commit message. Example: 'OI-01: #comment Added cool feature.'\n\n"

if ! grep -iqE "$commit_regex" "$1"; then
    printf "$message"
    exit 1
fi
