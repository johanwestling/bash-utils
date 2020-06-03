#!/bin/bash

#
# Text
#

input_text(){
  local label="$1"
  local label_length=${#label}
  local line=$(eval printf "─"'%.0s' {1..$label_length})
  local hint="$2"
  local marker="${3:- 👉 }"

  echo "$(tput bold)$label$(tput sgr0)" >&2
  echo -e "\033[32m$line\033[39m" >&2
  if [ -n "$hint" ]; then
    echo "$(tput dim)$hint$(tput sgr0)" >&2
  fi
  echo ""
  read -p "$(tput bold)$marker" value >&2
  echo "" >&2

  echo "$value$(tput sgr0)"
}

#
# Select
#

input_select(){
  local label="$1"
  local line=$(eval printf "─"'%.0s' {1..${#label}})
  local hint="$2"
  local marker="${3:- 👉 }"
  local options=("${@:4}")
  local value=""
  local selected=0
  local index=0

  echo "$(tput bold)$label$(tput sgr0)" >&2
  echo -e "\033[32m$line\033[39m" >&2
  echo ""
  input_select_options "$marker"
  input_select_input "$marker"
  echo "" >&2

  echo "$value"
}

input_select_options(){
  local marker="$1"
  local display="$2"
  local indent=$(eval printf ""'%.0s' {1..${#marker}})

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
      echo -ne "$(tput bold)$marker" >&2
    else
      echo -ne "$indent" >&2
    fi

    echo "$option$(tput sgr0)" >&2

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
