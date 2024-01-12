My dotfiles. Uses GNU Stow to create symlinks.

## Create symlinks
To "install" all dotfiles use the make file:
```bash
make
```
Or, stow all directories:
```bash
stow --target=$HOME */
```

 
## Working with the private submodule
Upon first clone init submodules:
```Bash
git submodule init
```

Update Submodules (Themes):
```bash
git submodule update --rebase --remote
```

Notes on `terminfo`:
**Update 2024-01-09**
Since macOS 14 (Sonoma) the terminfo hack isn't necessary anymore, so I removed the file.

This was necessary to get the colors right in tmux, neovim, alacritty on my MacOS (tmux-256color in .tmux.conf). See this for context https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
You can check with the `./24-bit-color.sh` script.
