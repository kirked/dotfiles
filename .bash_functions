#!/bin/bash

join() {
  local IFS=$1
  shift
  echo "$*"
}

bytes() {
  local val=$1
  local len=${#val} i ch mod
  (( len-- ))
  for ((i=0; i <= len; i++))
  do
    ch=${val:$i:1}
    let "mod=$1 % 6"
    if [ $mod -eq 0 ]; then
      echo
    fi
    printf "(byte)0x%02x" \'$ch
    [ $i -ne $len ] && echo -n ","
    echo -n " "
  done
  echo
}

whatjar() {
  local pat=$1
  local path=$2
  for f in $(find $path -name '*.jar'); do
    val=$(unzip -l $f | grep $pat)
    if [[ "x$val" != 'x' ]]; then
      printf "$f:\n$val\n"
    fi
  done
}

mountAndroid() {
  hdiutil attach ~/code/android.sparseimage -mountpoint ~/code/android
}

