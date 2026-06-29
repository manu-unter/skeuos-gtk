#!/bin/sh
set -eu

VERSION=${VERSION:-4.22.4}
BASE_URL="https://gitlab.gnome.org/GNOME/gtk/-/raw/$VERSION/gtk/theme/Default"

download() {
	file=$1
	mkdir -p "$(dirname "$file")"
	printf 'Downloading GTK %s %s\n' "$VERSION" "$file"
	curl -fsSL "$BASE_URL/$file" -o "$file"
}

for file in \
	Default-light.scss \
	Default-dark.scss \
	_colors.scss \
	_common.scss \
	_drawing.scss \
	_colors-public.scss \
	assets.svg \
	assets.txt
do
	download "$file"
done
