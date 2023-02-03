#!/usr/bin/env bash

# Adapted from https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$(find ~/Repos/ ~/Repos/at-factory ~/Repos/contrib ~/Repos/vrec ~/Repos/db ~/Repos/training ~/Repos/scratch -mindepth 1 -maxdepth 1 -type d | fzf)
fi

# Exit if nothing found
if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)


function create_windows_for_special_projects {
  if [[ $selected_name == "personalised-recommendations" ]]; then
      window=0
      tmux rename-window -t $selected_name:$window "Vim"
      tmux send-keys -t $selected_name:$window "conda activate persrec" C-m
      tmux send-keys -t $selected_name:$window "vim" C-m
      window=1
      tmux new-window -t $selected_name:$window -n "Shell" -c $selected
      tmux send-keys -t $selected_name:$window "conda activate persrec" C-m
  elif [[ $selected_name == "mytechblog" ]]; then
      window=0
      tmux rename-window -t $selected_name:$window "Vim"
      tmux send-keys -t $selected_name:$window "vim" C-m
      window=1
      tmux new-window -t $selected_name:$window -n "Shell" -c $selected
      window=2
      tmux new-window -t $selected_name:$window -n "Server" -c $selected
      tmux send-keys -t $selected_name:$window "hugo server -D" C-m
  elif [[ $selected_name == "codecrafters-redis-rust" ]]; then
      window=0
      tmux rename-window -t $selected_name:$window "Vim"
      tmux send-keys -t $selected_name:$window "vim" C-m
      window=1
      tmux new-window -t $selected_name:$window -c $selected
      tmux split-window -t $selected_name:$window -h -c $selected
      tmux split-window -t $selected_name:$window.1 -v -c $selected
      tmux send-keys -t $selected_name:$window.1 "redis-server --port 6380" C-m
      tmux send-keys -t  $selected_name:$window.2 "./spawn_redis_server.sh" C-m
  else
      window=0
      tmux send-keys -t $selected_name:$window "vim" C-m
      window=1
      tmux new-window -t $selected_name:$window -c $selected
  fi
}

# If not in TMUX and no Session running, start
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -ds $selected_name -c $selected
  create_windows_for_special_projects
  tmux attach-session -t $selected_name:0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds $selected_name -c $selected
  create_windows_for_special_projects
  tmux switch-client -t $selected_name:0
fi



