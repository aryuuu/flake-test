# flake2/flake.nix
{
  description = "Flake 2: Dev Shell that imports Flake 1";

  inputs.flake1.url = "path:../flake1"; # Local path to flake 1
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, flake1 }: {
    devShell = nixpkgs.lib.mkShell {
      buildInputs = [ flake1.packages.default ];
    };
  };
}

