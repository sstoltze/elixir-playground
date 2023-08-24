{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.sqlite
                        pkgs.inotify-tools
                      ];
}
