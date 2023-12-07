{
  description = "Haskell D&D utility to find encounter difficulties";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        config = { };

        overlay = pkgsNew: pkgsOld: {
          encounter-difficulty = pkgsNew.haskell.lib.justStaticExecutables
            pkgsNew.haskellPackages.encounter-difficulty;

          haskellPackages = pkgsOld.haskellPackages.override (old: {
            overrides = pkgsNew.haskell.lib.packageSourceOverrides {
              encounter-difficulty = ./.;
            };
          });
        };

        pkgs = import nixpkgs {
          inherit config system;
          overlays = [ overlay ];
        };

      in rec {
        packages.default = pkgs.haskellPackages.encounter-difficulty;
        defaultPackage = pkgs.haskellPackages.encounter-difficulty;
        apps.default = {
          type = "app";

          program = "${pkgs.encounter-difficulty}/bin/encounter-difficulty";
        };

        devShells.default = pkgs.haskellPackages.encounter-difficulty.env;
      });
}
