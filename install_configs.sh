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

# Install a local gitconfig file that is used for properties such as name and
# email address.
# Also cleans up the sample file post-copy as it is explicitly copied over to
# the correct path.
# Note: Git includes do not follow symlinks.
file=$(find configs -type f -name config_local.sample)
config_dir=$(dirname ${file:8})
cp $(pwd)/$file $HOME/$config_dir/config_local
rm $HOME/$config_dir/config_local.sample
