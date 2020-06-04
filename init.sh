#!/bin/bash

return_path="$PWD"

if ! [ -f "bash-utils/init.sh" ]; then
  git clone "git@github.com:johanwestling/bash-utils.git" "bash-utils" > /dev/null 2>&1
elif [ -f "bash-utils/init.sh" ]; then
  cd "bash-utils"
  git pull > /dev/null 2>&1
  cd "$return_path"
fi

# Load all util files.
source <(cat "bash-utils/utils/"*)
