#!/bin/bash

return_path="$PWD"

# Clone repository (if missing)
! [ -f "bash-utils/init.sh" ] || (cd "bash-utils" && git pull --quiet)
[ -f "bash-utils/init.sh" ] || git clone --quiet "git@github.com:johanwestling/bash-utils.git" "bash-utils"

# Load all util files.
source <(cat "bash-utils/utils/"*)
