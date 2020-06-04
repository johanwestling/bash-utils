# Bash-utils

## Gettings started

1. Create a bash script.
1. Add the following content:
    ```
    #!/bin/bash
    [ -d "bash-utils" ] || curl -sL "https://gist.githubusercontent.com/johanwestling/9c81e35db54c7d59882a28f0f7ddd455/raw/5eebd24dd0929763256c455b14b2b2e9ec378431/bash-utils.sh" | bash > /dev/null 2>&1 && source "bash-utils/init.sh"

    # Author your script here...
    ```
