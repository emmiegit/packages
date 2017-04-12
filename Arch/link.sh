#!/bin/bash
set -eu
files=('PKGBUILD'
       'fortune-mod-houseofcards.install'
       'houseofcards.txt')

source PKGBUILD

for file in "${source[@]}" PKGBUILD *.install; do
	if [[ -f "$file" ]]; then
		ln -fv "$file" aur/
	fi
done

