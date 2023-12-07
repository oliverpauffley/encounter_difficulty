{
  description = "Haskell D&D utility to find encounter difficulties";
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      overlay = pkgsNew: pkgsOld: {
        encounter-difficulty = pkgsNew.haskell.lib.justStaticExecutables
          pkgsNew.haskellPackages.encounter-difficulty;

        haskellPackages = pkgsOld.haskellPackages.override (old: {
          overrides = pkgsNew.haskell.lib.packageSourceOverrides {
            encounter-difficulty = ./.;
          };
        });
      };
      forAllSystems = function:
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ] (system:
          function (import nixpkgs {
            inherit system;
            overlays = [ overlay ];
          }));

    in rec {
      packages = forAllSystems
        (pkgs: { default = pkgs.haskellPackages.encounter-difficulty; });
      apps.default = {
        type = "app";

        program =
          "${nixpkgs.pkgs.encounter-difficulty}/bin/encounter-difficulty";
      };

      devShells.default = nixpkgs.haskellPackages.encounter-difficulty.env;
    };
}
