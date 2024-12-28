{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/bc27f0fde01ce4e1bfec1ab122d72b7380278e68";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            cargo
          ];
        };
      }
    );
}
