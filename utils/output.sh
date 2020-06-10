#!/bin/bash

task_title(){
  local text="$1"

  [ -n "$text" ] || read text

  local text_length=${#text}
  local line=$(eval printf "─"'%.0s' {1..$text_length})

  echo "$(tput bold)$text$(tput sgr0)"
  echo -e "\033[32m$line\033[39m"
  echo ""
}

task_label(){
  local text="$1"

  [ -n "$text" ] || read text

  echo " ◾$text$(tput sgr0)"
}

task_done(){
  local text="${1:-Done}"
  local icon="${task_done_icon:-${task_done_icon_default:-👍}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo "$(tput bold)$icon$text$(tput sgr0)"
  echo ""
}

task_fail(){
  local text="${1:-Failed}"
  local icon="${task_fail_icon:-${task_fail_icon_default:-👎}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo "$(tput bold)$icon$text$(tput sgr0)"
  echo ""
}

task_skip(){
  local text="${1:-Skipped}"
  local icon="${task_skip_icon:-${task_skp_icon_default:-👇}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo "$(tput bold)$icon$text$(tput sgr0)"
  echo ""
}

task_notice(){
  local text="${1}"
  local icon="${task_notice_icon:-${task_notice_icon_default:-👋}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo "$(tput bold)$icon$text$(tput sgr0)"
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

indent(){
  while read line; do
    echo -e "$line" | sed 's/^/  /'
  done
}
