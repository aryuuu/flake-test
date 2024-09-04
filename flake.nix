{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
    krakend.url = "git+file:/home/fatt/project/krakend-flake";
  };

  outputs = { self, nixpkgs, systems, krakend, ... }: 
  let 
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs (import systems);
      pkgsFor = eachSystem (system:
        import nixpkgs {
          system = system;
        }
      );
  in
  {

      devShells = eachSystem (system: {
        krakend = pkgsFor.${system}.mkShell {
          packages = [ 
            pkgsFor.${system}.fish 
            pkgsFor.${system}.hello
            krakend.packages.${system}.default
          ];

          shellHook = ''
            cd krakend
          '';
        };

        serviceA = pkgsFor.${system}.mkShell {
          packages = [ 
            pkgsFor.${system}.fish 
            pkgsFor.${system}.go
          ];
        };
      });

  };
}
