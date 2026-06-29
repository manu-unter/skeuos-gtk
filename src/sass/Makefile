include ../Makefile.inc

THEMES_DIR=../../themes/
MODERN_BUILD_DIR=modern/build
MODERN_DISTRIBUTION_COLORS ?= Blue

.PHONY: build build-modern build-modern-distribution build-modern-libadwaita build-modern-libadwaita-split build-modern-gtk4-4.22 build-modern-gtk4-4.22-split build-modern-gnome-shell-50 clean clean-modern

build: clean
	$(MAKE) $(TARGETS)
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-4.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/cinnamon/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_42/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_40+41/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_38+36/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_42/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_40+41/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/); \
	  cp gtk3-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk-dark.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk-dark.css ; \
	  cp gtk4-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk-dark.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-4.0/gtk.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-4.0/gtk-dark.css ; \
	  cp cinnamon-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/cinnamon/cinnamon.css ; \
	  cp cinnamon-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/cinnamon/cinnamon.css ; \
	  cp gnome-shell-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	done

define scss_to_css
%-$(1).css: %.scss
	sed -e '/$$$$selected_bg_color/c $$$$selected_bg_color: $$(COLOR_$(1));' \
	    -e '/$$$$selected_fg_color/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1));' $$< \
	  | $(SCSS) > $$@
	$$(if $$(findstring gtk, $$@), \
	  cat $(wildcard gtk-applications-css/**/*.css) >> $$@)

TARGETS += $$(patsubst %.scss,%-$(1).css,$$(wildcard *.scss))
endef

$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call scss_to_css,$(COLOR_VARIANT))))

MODERN_LIBADWAITA_TARGETS = $(foreach COLOR,$(COLOR_VARIANTS), \
	$(MODERN_BUILD_DIR)/libadwaita-$(COLOR).css)
MODERN_LIBADWAITA_SPLIT_TARGETS = $(foreach COLOR,$(COLOR_VARIANTS), \
	$(MODERN_BUILD_DIR)/libadwaita-light-$(COLOR).css \
	$(MODERN_BUILD_DIR)/libadwaita-dark-$(COLOR).css)
MODERN_GTK422_TARGETS = $(foreach COLOR,$(COLOR_VARIANTS), \
	$(MODERN_BUILD_DIR)/gtk4-4.22-$(COLOR).css)
MODERN_GTK422_SPLIT_TARGETS = $(foreach COLOR,$(COLOR_VARIANTS), \
	$(MODERN_BUILD_DIR)/gtk4-4.22-light-$(COLOR).css \
	$(MODERN_BUILD_DIR)/gtk4-4.22-dark-$(COLOR).css)
MODERN_GNOME_SHELL_50_TARGETS = $(foreach COLOR,$(COLOR_VARIANTS), \
	$(MODERN_BUILD_DIR)/gnome-shell-50-light-$(COLOR).css \
	$(MODERN_BUILD_DIR)/gnome-shell-50-dark-$(COLOR).css)
MODERN_DISTRIBUTION_TARGETS = $(foreach COLOR,$(MODERN_DISTRIBUTION_COLORS), \
	$(THEMES_DIR)Skeuos-$(COLOR)-Adaptive/gtk-4.0/gtk.css)

build-modern: build-modern-libadwaita build-modern-gtk4-4.22 build-modern-gnome-shell-50

build-modern-distribution: $(MODERN_DISTRIBUTION_TARGETS)

build-modern-libadwaita: $(MODERN_LIBADWAITA_TARGETS)

build-modern-libadwaita-split: $(MODERN_LIBADWAITA_SPLIT_TARGETS)

build-modern-gtk4-4.22: $(MODERN_GTK422_TARGETS)

build-modern-gtk4-4.22-split: $(MODERN_GTK422_SPLIT_TARGETS)

build-modern-gnome-shell-50: $(MODERN_GNOME_SHELL_50_TARGETS)

$(MODERN_BUILD_DIR):
	mkdir -p $@

$(MODERN_GTK422_TARGETS) $(MODERN_GTK422_SPLIT_TARGETS): modern/_gtk4-4.22-body.scss
$(MODERN_GNOME_SHELL_50_TARGETS): gnome-shell-50/_colors.scss gnome-shell-50/_common-tweaks.scss

define modern_pair_to_css
$(MODERN_BUILD_DIR)/$(1)-light-$(2).css: modern/$(1)-light.scss | $(MODERN_BUILD_DIR)
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(2)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(2)) !default;' $$< \
	  | $$(SCSS) > $$@

$(MODERN_BUILD_DIR)/$(1)-dark-$(2).css: modern/$(1)-dark.scss | $(MODERN_BUILD_DIR)
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(2)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(2)) !default;' $$< \
	  | $$(SCSS) > $$@
endef

define modern_libadwaita_adaptive_to_css
$(MODERN_BUILD_DIR)/libadwaita-$(1).css: libadwaita/upstream/gtk.scss modern/libadwaita-colors-light.scss modern/libadwaita-colors-dark.scss | $(MODERN_BUILD_DIR)
	$$(SCSS) libadwaita/upstream/gtk.scss > $$@
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(1)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1)) !default;' modern/libadwaita-colors-light.scss \
	  | $$(SCSS) >> $$@
	printf '\n@media (prefers-color-scheme: dark) {\n' >> $$@
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(1)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1)) !default;' modern/libadwaita-colors-dark.scss \
	  | $$(SCSS) | sed 's/^/  /' >> $$@
	printf '}\n' >> $$@
endef

define modern_gtk422_adaptive_to_css
$(MODERN_BUILD_DIR)/gtk4-4.22-$(1).css: modern/gtk4-4.22-light.scss modern/gtk4-4.22-dark.scss | $(MODERN_BUILD_DIR)
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(1)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1)) !default;' modern/gtk4-4.22-light.scss \
	  | $$(SCSS) > $$@
	printf '\n@media (prefers-color-scheme: dark) {\n' >> $$@
	sed -e '/selected_bg_color: #.*!default;/c $$$$selected_bg_color: $$(COLOR_$(1)) !default;' \
	    -e '/selected_fg_color: #.*!default;/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1)) !default;' modern/gtk4-4.22-dark.scss \
	  | $$(SCSS) | sed 's/^/  /' >> $$@
	printf '}\n' >> $$@
endef

define modern_distribution_to_theme
$(THEMES_DIR)Skeuos-$(1)-Adaptive/gtk-4.0/gtk.css: $(MODERN_BUILD_DIR)/gtk4-4.22-$(1).css $(MODERN_BUILD_DIR)/libadwaita-$(1).css ../assets-renderer/gtk3/assets-$(1)/check-symbolic.svg libadwaita/upstream/assets/devel-symbolic.svg
	mkdir -p $$(dir $$@)assets
	printf '/* GTK 4.22 adaptive base */\n' > $$@
	cat $(MODERN_BUILD_DIR)/gtk4-4.22-$(1).css >> $$@
	printf '\n/* libadwaita adaptive layer */\n' >> $$@
	cat $(MODERN_BUILD_DIR)/libadwaita-$(1).css >> $$@
	sed -i 's/[[:space:]]*$$$$//' $$@
	cp ../assets-renderer/gtk3/assets-$(1)/* $$(dir $$@)assets/
	cp libadwaita/upstream/assets/*.svg $$(dir $$@)assets/
	ln -sf gtk.css $$(dir $$@)gtk-dark.css
	printf '[Desktop Entry]\nType=X-GNOME-Metatheme\nName=Skeuos-$(1)-Adaptive\nComment=Skeuos $(1) Adaptive theme\nEncoding=UTF-8\n\n[X-GNOME-Metatheme]\nGtkTheme=Skeuos-$(1)-Adaptive\nMetacityTheme=Adwaita\nIconTheme=Adwaita\nCursorTheme=Adwaita\nButtonLayout=:minimize,maximize,close\n' > $(THEMES_DIR)Skeuos-$(1)-Adaptive/index.theme
endef

$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_libadwaita_adaptive_to_css,$(COLOR_VARIANT))))
$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_gtk422_adaptive_to_css,$(COLOR_VARIANT))))
$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_distribution_to_theme,$(COLOR_VARIANT))))
$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_pair_to_css,libadwaita,$(COLOR_VARIANT))))
$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_pair_to_css,gtk4-4.22,$(COLOR_VARIANT))))
$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call modern_pair_to_css,gnome-shell-50,$(COLOR_VARIANT))))

clean:
	-rm *.css

clean-modern:
	-rm -r $(MODERN_BUILD_DIR)
