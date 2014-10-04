#!/bin/bash

function exists-or-clone {
  local shortname=$(echo $1 | sed -E 's|.+/(.+)|\1|' | sed -E 's/\.git//')
  if [ ! -d "plugins/$shortname" ]; then
    echo "$shortname does not exist, cloning"
    git clone $1 plugins/$shortname
  fi
}

read -d '' remotes <<EOF
https://github.com/hchbaw/opp.zsh
EOF

echo "$remotes" | while IFS=\n read -r i; do
  exists-or-clone $i
done

if [ ! -L "$HOME/.zshrc" ]; then
  echo "Linking zshrc"
  cd $HOME && ln -s .zsh/.zshrc
fi
