#!/bin/bash
set -eu

rm -fv *.tar*
rm -rfv pkg/ src/

if [[ -f .gitignore ]]; then
	while read -r fn; do
		rm -rfv -- "$fn"
	done < .gitignore
fi

