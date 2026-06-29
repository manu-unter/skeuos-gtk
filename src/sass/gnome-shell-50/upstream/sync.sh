#!/bin/sh
set -eu

VERSION=${VERSION:-50.2}
BASE_URL="https://gitlab.gnome.org/GNOME/gnome-shell/-/raw/$VERSION/data/theme"

download() {
	file=$1
	mkdir -p "$(dirname "$file")"
	printf 'Downloading GNOME Shell %s %s\n' "$VERSION" "$file"
	curl -fsSL "$BASE_URL/$file" -o "$file"
	sed 's/resource:\/\/\/org\/gnome\/shell\/theme/assets/g' -i "$file"
}

for file in \
	README.md \
	pad-osd.css \
	calendar-today-light.svg \
	calendar-today.svg \
	dash-placeholder.svg \
	gnome-shell-dark.scss \
	gnome-shell-high-contrast.scss \
	gnome-shell-light.scss \
	gnome-shell-start.svg \
	running-indicator.svg \
	workspace-placeholder.svg \
	gnome-shell-sass/_colors.scss \
	gnome-shell-sass/_common.scss \
	gnome-shell-sass/_default-colors.scss \
	gnome-shell-sass/_drawing.scss \
	gnome-shell-sass/_high-contrast-colors.scss \
	gnome-shell-sass/_palette.scss \
	gnome-shell-sass/_widgets.scss \
	gnome-shell-sass/widgets/_a11y.scss \
	gnome-shell-sass/widgets/_app-grid.scss \
	gnome-shell-sass/widgets/_base.scss \
	gnome-shell-sass/widgets/_buttons.scss \
	gnome-shell-sass/widgets/_calendar.scss \
	gnome-shell-sass/widgets/_check-box.scss \
	gnome-shell-sass/widgets/_corner-ripple.scss \
	gnome-shell-sass/widgets/_dash.scss \
	gnome-shell-sass/widgets/_dialogs.scss \
	gnome-shell-sass/widgets/_entries.scss \
	gnome-shell-sass/widgets/_ibus-popup.scss \
	gnome-shell-sass/widgets/_keyboard.scss \
	gnome-shell-sass/widgets/_login-lock.scss \
	gnome-shell-sass/widgets/_looking-glass.scss \
	gnome-shell-sass/widgets/_message-list.scss \
	gnome-shell-sass/widgets/_misc.scss \
	gnome-shell-sass/widgets/_notifications.scss \
	gnome-shell-sass/widgets/_osd.scss \
	gnome-shell-sass/widgets/_overview.scss \
	gnome-shell-sass/widgets/_panel.scss \
	gnome-shell-sass/widgets/_popovers.scss \
	gnome-shell-sass/widgets/_quick-settings.scss \
	gnome-shell-sass/widgets/_screenshot.scss \
	gnome-shell-sass/widgets/_scrollbars.scss \
	gnome-shell-sass/widgets/_search-entry.scss \
	gnome-shell-sass/widgets/_search-results.scss \
	gnome-shell-sass/widgets/_slider.scss \
	gnome-shell-sass/widgets/_switcher-popup.scss \
	gnome-shell-sass/widgets/_switches.scss \
	gnome-shell-sass/widgets/_window-picker.scss \
	gnome-shell-sass/widgets/_workspace-switcher.scss \
	gnome-shell-sass/widgets/_workspace-thumbnails.scss
do
	download "$file"
done
