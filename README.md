## kevinkjt2000's dot-files
The dotfiles are managed using dotdrop: https://github.com/deadc0de6/dotdrop

```sh
git submodule update --init --recursive asdf
ln -sf "$(pwd)/asdf" "$HOME/.asdf"
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
asdf plugin-add python
asdf install
python -m pip install dotdrop
dotdrop install
```
