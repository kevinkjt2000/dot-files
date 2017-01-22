#!/usr/bin/env bash
#
# kevinkjt2000/files ellipsis package

pkg.link() {
  if [ $(hostname) = "Toxicity" ]; then
    fs.link_file asoundrc
  fi
  fs.link_file gitconfig
  mkdir -p "$ELLIPSIS_HOME/.xmonad"
  fs.link_file xmonad/xmonad.hs "$ELLIPSIS_HOME/.xmonad/xmonad.hs"
  mkdir -p "$ELLIPSIS_HOME/.config/openbox"
  fs.link_file config/openbox/lxde-rc.xml "$ELLIPSIS_HOME/.config/openbox/lxde-rc.xml"
}

pkg.links() {
  msg.bold "${1:-$PKG_NAME}"
  local files=".gitconfig .xmonad/xmonad.hs .config/openbox/lxde-rc.xml"
  if [ $(hostname) = "Toxicity" ]; then
    files+=" .asoundrc"
  fi
  for file in $files; do
    local file="$ELLIPSIS_HOME/$file"
    local link="$(readlink "$file")"
    echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
  done
}

pkg.unlink() {
  rm "$ELLIPSIS_HOME/.config/openbox/lxde-rc.xml"
  rm "$ELLIPSIS_HOME/.xmonad/xmonad.hs"
  hooks.unlink
}

