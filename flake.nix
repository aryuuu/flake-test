{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    devShells.x86_64-linux.serviceA = pkgs.mkShell {
      buildInputs = [ pkgs.nodejs pkgs.fish ];
      shellHook = ''
        export FATT=A
        cd serviceA
      '';
    };

    devShells.x86_64-linux.serviceB = pkgs.mkShell {
      buildInputs = [ pkgs.go pkgs.fish ];

      shellHook = ''
        export FATT=B
        cd serviceB
      '';
    };

  };
}
