Skeuos GTK
===

# More information at [drasite.com/skeuos-gtk](https://drasite.com/skeuos-gtk)

![Skeuos GTK theme colors preview](https://github.com/daniruiz/skeuos-gtk/raw/master/assets/colors-preview.png)

## Development environment

This repo includes a `shell.nix` for the tools needed to rebuild the theme outputs:

- `inkscape` for rendered SVG/PNG assets
- `optipng` for PNG optimization
- `sassc` for GTK/Cinnamon/GNOME Shell CSS
- `make` for the existing build targets

With `direnv` installed, run this once from the repo root:

```sh
direnv allow
```

After that, entering the repo loads the Nix environment automatically and `make build` can run without manually wrapping it in `nix-shell`/`nix shell`.
