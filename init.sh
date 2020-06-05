#!/bin/bash

return_path="$PWD"

if ! [ -f "bash-utils/init.sh" ]; then
  git clone -q "git@github.com:johanwestling/bash-utils.git" "bash-utils"
fi

# Load all util files.
source <(cat "bash-utils/utils/"*)
