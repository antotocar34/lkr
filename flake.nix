{
  description = "lkr build flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [];
    };
  in {


    packages.x86_64-linux.lkr = import ./default.nix { inherit pkgs; };

    packages.x86_64-linux.default = self.packages.x86_64-linux.lkr;

  };
}
