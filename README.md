My dotfiles. Uses GNU Stow to create symlinks.

To "install" all dotfiles use the make file:
```bash
make
```
Or, stow all directories:
```bash
stow --target=$HOME */
```

