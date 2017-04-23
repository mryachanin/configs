#!/bin/bash

cd $(dirname $0)

for file in $(find configs -type f);
do
  config_dir=$(dirname ${file:8})
  mkdir -p $HOME/$config_dir
  ln -sf $(pwd)/$file $HOME/$config_dir/
done
