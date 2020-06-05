#!/bin/bash

return_path="$PWD"
utils_path="${utils_path:-bash-utils}"
utils_repository="${utils_repository:-git@github.com:johanwestling/bash-utils.git}"

if ! [ -f "$utils_path/init.sh" ]; then
  git clone -q "$utils_repository" "$utils_path"
fi

# Load all util files.
source <(cat "$utils_path/utils/"*)
