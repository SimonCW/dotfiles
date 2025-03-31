#!/bin/bash
# Run nvim with uv script dependencies to have working lsp
temp=$(mktemp)
trap 'unlink $temp' EXIT
uv export --script $1 --no-hashes >$temp
uv run --with-requirements $temp nvim $1
