{
  description = "A Nix-flake-based LaTeX development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
          tex = pkgs.texlive.combined.scheme-full;
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [ 
              tex
              texlab
              tectonic
            ];
          };
        }
      );
}
