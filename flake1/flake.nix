# flake1/flake.nix
{
  description = "Flake 1: Simple C Project that prints HEYAA";

  outputs = { self, nixpkgs }: {
    packages.default = nixpkgs.lib.mkDerivation {
      pname = "heyaa";
      version = "1.0.0";

      src = ./src;

      buildInputs = [ nixpkgs.gcc ];

      buildPhase = ''
        gcc -o heyaa main.c
      '';

      installPhase = ''
        mkdir -p $out/bin
        cp heyaa $out/bin/
      '';
    };
  };
}

