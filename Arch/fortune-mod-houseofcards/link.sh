#!/bin/sh
files=('PKGBUILD'
       'fortune-mod-houseofcards.install'
       'houseofcards.txt')

for file in "${files[@]}"; do
    ln -f "$file" aur/
done

