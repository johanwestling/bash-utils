#!/bin/bash

#
# Text
#

input_text(){
  local label="$1"
  local label_length=${#label}
  local line=$(eval printf "─"'%.0s' {1..$label_length})
  local hint="$input_text_hint"
  local marker="${input_text_marker:-${input_text_marker_default:-👉}}"

  input_text_hint=""

  [ -z "$marker" ] || marker=" $marker "

  echo -e "\033[1;39m$label\033[0;39m" >&2
  echo -e "\033[1;32m$line\033[0;39m" >&2
  [ -z "$hint" ] || echo "\033[2m$hint\033[0;39m" | indent >&2
  echo -e "\033[1;39m" >&2
  read -p "$marker" value >&2
  echo -e "\033[0;39m" >&2

  echo -e "$value"
}

#
# Select
#

input_select(){
  local label="$1"
  local line=$(eval printf "─"'%.0s' {1..${#label}})
  local options=("${@:2}")
  local value=""
  local selected=0
  local index=0
  local hint="$input_select_hint"
  local marker="${input_select_marker:-${input_select_marker_default:-👉}}"

  input_select_hint=""

  echo -e "\033[1;39m$label\033[0;39m" >&2
  echo -e "\033[1;32m$line\033[0;39m" >&2
  [ -z "$hint" ] || echo "\033[2m$hint\033[0;39m" | indent >&2
  echo -e "" >&2
  input_select_options "$marker"
  input_select_input "$marker"
  echo -e "\033[0;39m" >&2

  echo -e "$value"
}

input_select_options(){
  local marker="$1"
  local display="$2"

  if [[ "$display" = "clear" ]]; then
    index=0

    for option in "${options[@]}"; do
      echo -ne "\033[1A\033[2K" >&2

      index=$(( $index + 1 ))
    done
  fi

  index=0

  for option in "${options[@]}"; do
    if [[ "$index" = "$selected" ]]; then
      echo -ne "\033[1;39m $marker " >&2
    else
      echo -ne "    " >&2
    fi

    echo -e "$option\033[0;39m" >&2

    index=$(( $index + 1 ))
  done
}

input_select_input(){
  local marker="$1"

  while [ "$value" = "" ]; do
    IFS=
    read -r -sn 1 key

    case $key in
      A)
        # Up key
        selected=$(( $selected - 1 ))
        if [ $selected -lt 0 ]; then
          selected=0
        fi
        input_select_options "$marker" "clear"
        ;;

      B)
        # Down key
        selected=$(( $selected + 1 ))
        if [ $selected -gt $(( $index - 1 )) ]; then
          selected=$(( $index - 1 ))
        fi
        input_select_options "$marker" "clear"
        ;;

      "")
        # Enter key
        value="${options[$selected]}"
        ;;
    esac
  done
}
