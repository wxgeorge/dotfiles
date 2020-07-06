#!/bin/bash

files=$(ls -a | grep "^\." | grep -v "^\.\{1,2\}$")
this_directory="$( cd "$(dirname "$0")"; pwd -P)"

for file in $files; do
  path_1=$(readlink $HOME/$file)
  path_2=${this_directory}/$file
  if [[ -L "${HOME}/${file}" ]]; then
    # home directory version is a link.
    # Does it link the same place?
    if [[ "${path_1}" != "${path_2}" ]]; then
      echo "${file} is linked to ${path_1}, not ${path_2}"
    fi
  elif [[ -f $HOME/$file ]]; then
    # v1 is a simple file
    # does it at least match in content?
    if [[ $( diff -q $path_1 $path_2 1>/dev/null; echo $? ) -eq 1 ]]; then
      echo "${file} in home directory is a simple file which does not match dropbox"
    else
      echo "${file} in home directory is a simple file, but matches dropbox"
    fi
  else
    echo "$file DOES NOT exist in home directory; linking"
    $(cd ~; ln -s ${path_2})
  fi
done

