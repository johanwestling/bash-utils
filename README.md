# Bash-utils

## Gettings started

1. Create a bash script.
1. Add the following content:
    ```
    #!/bin/bash
    [ -d "bash-utils" ] source "bash-utils/init.sh" || curl -sL "https://github.com/johanwestling/bash-utils/raw/master/bash-utils/init.sh" | source

    # Author your script here...
    ```
