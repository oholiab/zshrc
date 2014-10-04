#!/bin/bash

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
git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
https://github.com/hchbaw/opp.zsh
EOF

echo "$remotes" | while IFS=\n read -r i; do
  exists-or-clone $i
done

if [ ! -L "$HOME/.zshrc" ]; then
  echo "Linking zshrc"
  cd $HOME && ln -s .zsh/.zshrc
fi
