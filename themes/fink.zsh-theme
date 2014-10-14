#!/usr/bin/zsh

typeset -A host_colors
host_colors["ldneng50-146"]=020
host_colors["YELP-USERNAME"]=020

function get_host_color {
  color="${host_colors["$1"]}"
  
  if [ "$color" = '' ]; then
    color=$(printf "%03d" $(($(echo $1 | sum | awk '{print substr($0,0,3)}') % 255)))
  fi
  echo $color
}
host_color="$(get_host_color "$(hostname -s)")"

INS_PROMPT="🜏  "
CMD_PROMPT="⛤  "

THE_PROMPT='%{$FG[$host_color]%}λ %{$reset_color%}%~/ $(git_prompt_info)%{$reset_color%}'
PROMPT="${THE_PROMPT}${INS_PROMPT}"

function zle-line-init zle-keymap-select {
  PROMPT="$THE_PROMPT"
  PROMPT="$PROMPT${${KEYMAP/vicmd/$CMD_PROMPT}/(main|viins)/$INS_PROMPT}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"
