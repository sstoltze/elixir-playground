{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.sqlite
                        pkgs.inotify-tools
                        pkgs.elixir-ls
                        pkgs.elixir_1_14
                      ];
}
