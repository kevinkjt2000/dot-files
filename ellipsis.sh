#!/usr/bin/env bash
#
# kevinkjt2000/files ellipsis package

pkg.link() {
	if [ $(hostname) = "Toxicity" ]; then
		fs.link_file toxicity/asoundrc
		fs.link_file toxicity/nvidia-settings-rc
		fs.link_file toxicity/xinitrc
	fi
	mkdir -p "$ELLIPSIS_HOME/.config"
	fs.link_rfiles config "$ELLIPSIS_HOME/.config"
	fs.link_files home
}

pkg.links() {
	msg.bold "${1:-$PKG_NAME}"
	for f in config/*; do
		files+=" .$f"
	done
	for f in home/*; do
		files+=" .${f/#home\//}"
	done
	if [ $(hostname) = "Toxicity" ]; then
		for f in toxicity/*; do
			files+=" .${f/#toxicity\//}"
		done
	fi
	local sorted_files=$(echo $files | xargs -n 1 echo | sort)
	for file in $sorted_files; do
		local file="$ELLIPSIS_HOME/$file"
		local link="$(readlink "$file")"
		echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
	done
}

pkg.unlink() {
	for f in config/*; do
		rm "$ELLIPSIS_HOME/.$f"
	done
	for f in home/*; do
		rm "$ELLIPSIS_HOME/.${f/#home\//}"
	done
	if [ $(hostname) = "Toxicity" ]; then
		for f in toxicity/*; do
			rm "$ELLIPSIS_HOME/.${f/#toxicity\//}"
		done
	fi
}

