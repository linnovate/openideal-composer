#!/usr/bin/env bash

docroot=$(pwd)
git_dir="web/profiles/contrib/idea/.git/hooks"
scripts_dir="../../scripts/git-hooks"

cd scripts/git-hooks
for file in *; do
  filename="${file%.*}"
  file_path="$docroot/$git_dir/$filename"

  # Remove sample and existing file.
  rm -f "$file_path.sample"
  rm -f $file_path

  # Copy file to hooks directory and make it executable.
  cp $scripts_dir/$file $file_path
  chmod 777 $file_path
  chmod +x $file_path
done
