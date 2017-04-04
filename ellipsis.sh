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
	fs.link_file config/gitignore_global "$ELLIPSIS_HOME/.config/gitignore_global"
	fs.link_file emacs
	fs.link_file ctags
	mkdir -p "$ELLIPSIS_HOME/.config/git/template/hooks"
	fs.link_file config/git/template/hooks/ctags "$ELLIPSIS_HOME/.config/git/template/hooks/ctags"
	fs.link_file config/git/template/hooks/post-checkout "$ELLIPSIS_HOME/.config/git/template/hooks/post-checkout"
	fs.link_file config/git/template/hooks/post-commit "$ELLIPSIS_HOME/.config/git/template/hooks/post-commit"
	fs.link_file config/git/template/hooks/post-merge "$ELLIPSIS_HOME/.config/git/template/hooks/post-merge"
	fs.link_file config/git/template/hooks/post-rewrite "$ELLIPSIS_HOME/.config/git/template/hooks/post-rewrite"
	fs.link_file xinitrc
}

pkg.links() {
	msg.bold "${1:-$PKG_NAME}"
	local files=".gitconfig .xmonad/xmonad.hs .config/openbox/lxde-rc.xml .emacs"
	files+=" .config/gitignore_global .ctags"
	for f in "config/git/template/hooks/*"; do
		files+=" .$f"
	done
	if [ $(hostname) = "Toxicity" ]; then
		files+=" .asoundrc xinitrc"
	fi
	for file in $files; do
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
	hooks.unlink
}

