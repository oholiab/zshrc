#!/bin/bash

if [ ! -z $1 ]; then
  home=$1
else
  home=$HOME
fi

function exists-or-clone {
  if [ -z $2 ]; then
    local dest="plugins/$(echo $1 | sed -E 's|.+/(.+)|\1|' | sed -E 's/\.git//')"
  else
    local dest=$2
  fi

  if [ ! -d "$dest" ]; then
    echo "$dest does not exist, cloning"
    git clone $1 $dest
  fi
}

read -d '' remotes <<EOF
git://github.com/robbyrussell/oh-my-zsh.git ${home}/.oh-my-zsh
https://github.com/hchbaw/opp.zsh
EOF

cd $home

echo "$remotes" | while IFS=\n read -r i; do
  exists-or-clone $i
done

if [ ! -L "$home/.zshrc" ]; then
  echo "Linking zshrc"
  cd $home && ln -s .zsh/.zshrc
fi
