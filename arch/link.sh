#!/bin/bash
source PKGBUILD
set -eu

for file in "${source[@]}" PKGBUILD *.install; do
	if [[ -f "$file" ]]; then
		ln -fv "$file" aur/
	fi
done

(cd aur; makepkg --printsrcinfo > .SRCINFO)

