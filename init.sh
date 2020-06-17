#!/bin/bash

return_path="$PWD"
utils_path="${utils_path:-bash-utils}"
utils_repository="${utils_repository:-git@github.com:johanwestling/bash-utils.git}"

if ! [ -f "$utils_path/init.sh" ]; then
  git clone -q "$utils_repository" "$utils_path"
fi

# Load all util files.
for utils_file in "$utils_path/utils/"*; do
  source "$utils_file"
done
