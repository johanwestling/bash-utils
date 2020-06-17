#!/bin/bash

task_title(){
  local text="$1"

  [ -n "$text" ] || read text

  local text_length=${#text}
  local line=$(eval printf "─"'%.0s' {1..$text_length})

  echo -e "\033[1;39m$text\033[0;39m"
  echo -e "\033[1;32m$line\033[0;39m"
  echo -e ""
}

task_label(){
  local text="$1"
  local icon="${task_label_icon:-${task_label_icon_default:-∙}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
}

task_done(){
  local text="${1:-Done}"
  local icon="${task_done_icon:-${task_done_icon_default:-\033[1;32m●\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

task_fail(){
  local text="${1:-Failed}"
  local icon="${task_fail_icon:-${task_fail_icon_default:-\033[1;31m●\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

task_skip(){
  local text="${1:-Skipped}"
  local icon="${task_skip_icon:-${task_skp_icon_default:-\033[1;33m↓\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

task_notice(){
  local text="${1}"
  local icon="${task_notice_icon:-${task_notice_icon_default:-👉}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

lowercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo -e $(echo -e $text | tr '[:upper:]' '[:lower:]')
}

uppercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo -e $(echo -e $text | tr '[:lower:]' '[:upper:]')
}

indent(){
  while read line; do
    echo -e -e "$line" | sed 's/^/   /'
  done
}
