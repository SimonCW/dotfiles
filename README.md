My dotfiles. Uses GNU Stow to create symlinks.

To "install" all dotfiles use the make file:
```bash
make
```
Or, stow all directories:
```bash
stow --target=$HOME */
```

Notes on `terminfo`:
This was necessary to get the colors right in tmux, neovim, alacritty on my MacOS (tmux-256color in .tmux.conf). See this for context https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
You can check with the `./24-bit-color.sh` script.
