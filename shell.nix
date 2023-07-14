{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.hello
    pkgs.python39
    pkgs.clang
    pkgs.libcxx
    pkgs.python3Packages.setuptools

    # keep this line if you use bash
    pkgs.bashInteractive
  ];

  
nativeBuildInputs = [ pkgs.pkg-config ] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [
    # Add any Apple framework libraries your package needs, e.g.
    pkgs.darwin.apple_sdk.frameworks.IOKit
  ];
  NIX_CFLAGS_COMPILE = pkgs.lib.optionals pkgs.stdenv.isDarwin [
    "-I${pkgs.lib.getDev pkgs.libcxx}/include/c++/v1"
  ];
}
