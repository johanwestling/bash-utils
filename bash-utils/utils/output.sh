#!/bin/bash

task_title(){
  local text="$1"

  [ -n "$text" ] || read text

  local text_length=${#text}
  local line=$(eval printf "─"'%.0s' {1..$text_length})

  echo "$(tput bold)$text$(tput sgr0)" >&2
  echo -e "\033[32m$line\033[39m" >&2
}

task_label(){
  local text="$1"

  [ -n "$text" ] || read text

  echo " ◾$text$(tput sgr0)" >&2
}

task_done(){
  local text="${1:-Done}"

  [ -n "$text" ] || read text

  echo "👍 $(tput bold)$text$(tput sgr0)" >&2
  echo ""
}

task_fail(){
  local text="${1:-Failed}"

  [ -n "$text" ] || read text

  echo "👎 $(tput bold)$text$(tput sgr0)" >&2
  echo ""
}

task_notice(){
  local text="${1}"

  [ -n "$text" ] || read text

  echo "👋 $(tput bold)$text$(tput sgr0)" >&2
  echo ""
}

lowercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo $(echo $text | tr '[:upper:]' '[:lower:]')
}

uppercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo $(echo $text | tr '[:lower:]' '[:upper:]')
}
