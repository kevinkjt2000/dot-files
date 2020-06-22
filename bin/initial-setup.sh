#!/usr/bin/env bash
set -euo pipefail

git submodule update --init --recursive asdf
ln -sf "$(pwd)/asdf" "$HOME/.asdf"

set +u
source "$HOME/.asdf/asdf.sh"
set -u

source "$HOME/.asdf/completions/asdf.bash"
if ! asdf plugin-list | grep python >/dev/null 2>&1; then
  asdf plugin-add python
fi
asdf install python 3.8.3
python -m pip install --upgrade pip
python -m pip install --upgrade dotdrop
asdf reshim python
dotdrop install
