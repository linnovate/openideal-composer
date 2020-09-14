#!/usr/bin/env bash

# Helpers: color patterns.
RED='\033[0;31m'
NC='\033[0m'

phpcs_bin="../../../../vendor/bin/phpcs"

phpcs_exec () {
  out=$(${phpcs_bin} -q --colors --encoding=utf-8 --extensions=php,module,inc,install,test,profile,theme,info,txt,md,yml ./ --ignore=config,themes/openideal_theme/bootstrap --standard=${1})

  if [ $? != 0 ]; then
      echo "${1} - Coding Standards check failed."
      echo "$out"
      result="failed";
  fi
}

phpcs_exit () {
  if [[ $result = "failed" ]]; then
    printf "\n\n ${RED}[ERROR] Aborting commit.${NC} Please fix CS issues.\n\n"
    exit 1
  fi
}

# Run phpcs validation.
phpcs_exec Drupal
phpcs_exec DrupalPractice

phpcs_exit
