#!/usr/bin/env bash
#
# kevinkjt2000/files ellipsis package

pkg.link() {
	if [ $(hostname) = "Toxicity" ]; then
		fs.link_file asoundrc
	fi
	fs.link_file gitconfig
	mkdir -p "$ELLIPSIS_HOME/.xmonad"
	fs.link_rfiles xmonad "$ELLIPSIS_HOME/.xmonad"
	fs.link_file emacs
	fs.link_rfiles config "$ELLIPSIS_HOME/.config"
	fs.link_file xinitrc
	fs.link_file hgrc
	fs.link_file nvidia-settings-rc
	fs.link_file rvmrc
	fs.link_file gemrc
	fs.link_file toprc
	fs.link_file pylintrc
	mkdir -p "$ELLIPSIS_HOME/.ctags.d"
	fs.link_rfiles ctags.d "$ELLIPSIS_HOME/.ctags.d"
}

pkg.links() {
	msg.bold "${1:-$PKG_NAME}"
	local files=".gitconfig .emacs"
	files+=" .hgrc .rvmrc .gemrc .toprc .pylintrc"
	for f in ctags.d/* xmonad/* config/*; do
		files+=" .$f"
	done
	if [ $(hostname) = "Toxicity" ]; then
		files+=" .asoundrc .xinitrc .nvidia-settings-rc"
	fi
	local sorted_files=$(echo $files | xargs -n 1 echo | sort)
	for file in $sorted_files; do
		local file="$ELLIPSIS_HOME/$file"
		local link="$(readlink "$file")"
		echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
	done
}

pkg.unlink() {
	rm "$ELLIPSIS_HOME/.config/openbox/lxde-rc.xml"
	rm "$ELLIPSIS_HOME/.config/gitignore_global"
	rm "$ELLIPSIS_HOME/.xmonad/xmonad.hs"
	rm "$ELLIPSIS_HOME/.config/git/template/hooks/ctags"
	rm "$ELLIPSIS_HOME/.config/git/template/hooks/post-checkout"
	rm "$ELLIPSIS_HOME/.config/git/template/hooks/post-commit"
	rm "$ELLIPSIS_HOME/.config/git/template/hooks/post-merge"
	rm "$ELLIPSIS_HOME/.config/git/template/hooks/post-rewrite"
	rm "$ELLIPSIS_HOME/.config/.github/CONTRIBUTING.md"
	rm "$ELLIPSIS_HOME/.config/.github/ISSUE_AND_PULL_REQUEST_TEMPLATE.md"
	rm "$ELLIPSIS_HOME/.config/fontconfig/fonts.conf"
	rm $(fs.list_symlinks "$ELLIPSIS_HOME/.ctags.d")
	hooks.unlink
}

