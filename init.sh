#!/bin/bash

return_path="$PWD"

# Clone repository (if missing)
! [ -f "bash-utils/init.sh" ] || (cd "bash-utils" && git pull)
[ -f "bash-utils/init.sh" ] || git clone "git@github.com:johanwestling/bash-utils.git" "bash-utils"

# Load all util files.
source <(cat "bash-utils/utils/"*)
