#!/bin/bash

cd $(dirname $0)

# For every file defined in the configs project, create a folder in the
# current user's home directory and symlink any files respectively.
for file in $(find configs -type f);
do
  config_dir=$(dirname ${file:8})
  mkdir -p $HOME/$config_dir
  ln -sf $(pwd)/$file $HOME/$config_dir/
done
