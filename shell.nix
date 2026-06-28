{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gnumake
    inkscape
    optipng
    sassc
  ];
}
