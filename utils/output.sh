#!/bin/bash

output_title(){
  local text="$1"

  [ -n "$text" ] || read text

  local text_length=${#text}
  local line=$(eval printf "─"'%.0s' {1..$text_length})

  echo -e "\033[1;39m$text\033[0;39m"
  echo -e "\033[1;32m$line\033[0;39m"
  echo -e ""
}

output_label(){
  local text="$1"
  local icon="${output_label_icon:-${output_label_icon_default:-∙}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
}

output_done(){
  local text="${1:-Done}"
  local icon="${output_done_icon:-${output_done_icon_default:-\033[1;32m●\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

output_fail(){
  local text="${1:-Failed}"
  local icon="${output_fail_icon:-${output_fail_icon_default:-\033[1;31m●\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

output_skip(){
  local text="${1:-Skipped}"
  local icon="${output_skip_icon:-${output_skp_icon_default:-\033[1;33m↓\033[0;39m}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

output_notice(){
  local text="${1}"
  local icon="${output_notice_icon:-${output_notice_icon_default:-👉}}"

  [ -n "$text" ] || read text
  [ -z "$icon" ] || icon=" $icon "

  echo -e "$icon\033[1;39m$text\033[0;39m"
  echo -e ""
}

output_lowercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo -e $(echo -e $text | tr '[:upper:]' '[:lower:]')
}

output_uppercase(){
  local text="$1"

  [ -n "$text" ] || read text

  echo -e $(echo -e $text | tr '[:lower:]' '[:upper:]')
}

output_indent(){
  while read line; do
    echo -e -e "$line" | sed 's/^/   /'
  done
}
