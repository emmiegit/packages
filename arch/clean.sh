#!/bin/bash
set -eu

if [[ -f .noclean ]]; then
	readarray -t noclean < .noclean
else
	noclean=()
fi

should_clean() {
	for ((i = 0; i < "${#noclean[@]}"; i++)) {
		if [[ ${noclean[$i]} == $1 ]]; then
			return 1
		fi
	}
	return 0
}

should_clean tar && rm -fv *.tar*
should_clean pkg && rm -rfv pkg/
should_clean src && rm -rfv src/

if should_clean gitignore; then
	if [[ -f .gitignore ]]; then
		while read -r fn; do
			rm -rfv -- "$fn"
		done < .gitignore
	fi
fi
