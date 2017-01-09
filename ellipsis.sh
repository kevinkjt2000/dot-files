#!/usr/bin/env bash
#
# kevinkjt2000/files ellipsis package

pkg.link() {
  fs.link_file asoundrc
  fs.link_file gitconfig
  mkdir -p "$ELLIPSIS_HOME/.xmonad"
  fs.link_file xmonad/xmonad.hs "$ELLIPSIS_HOME/.xmonad/xmonad.hs"
}

pkg.links() {
  msg.bold "${1:-$PKG_NAME}"
  local files=".asoundrc .gitconfig .xmonad/xmonad.hs"
  for file in $files; do
    local file="$ELLIPSIS_HOME/$file"
    local link="$(readlink "$file")"
    echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
  done
}

pkg.unlink() {
  rm "$ELLIPSIS_HOME/.xmonad/xmonad.hs"
  hooks.unlink
}
