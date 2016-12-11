#!/usr/bin/env bash
#
# kevinkjt2000/files ellipsis package

pkg.link() {
  fs.link_file gitconfig
  mkdir -p ~/.xmonad
  fs.link_file xmonad/xmonad.hs ~/.xmonad/xmonad.hs
}

pkg.links() {
  msg.bold "${1:-$PKG_NAME}"
  local files="~/.gitconfig ~/.xmonad/xmonad.hs"
  for file in $files; do
    local link="$(readlink "$file")"
    echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
  done
}

pkg.unlink() {
  rm "~/.xmonad/xmonad.hs"
  hooks.unlink
}

