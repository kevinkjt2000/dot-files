#!/usr/bin/env bash
set -euo pipefail

git submodule update --init --recursive asdf
ln -sf "$(pwd)/asdf" "$HOME/.asdf"

set +u
source "$HOME/.asdf/asdf.sh"
set -ux

source "$HOME/.asdf/completions/asdf.bash"
if ! asdf plugin-list | grep python >/dev/null 2>&1; then
  asdf plugin-add python
fi
asdf install
asdf reshim
python -m pip install --upgrade pip wheel
python -m pip install --upgrade dotdrop
asdf reshim python
dotdrop install

# TODO: automate adding asdf plugins and importing gpg key for nodejs
