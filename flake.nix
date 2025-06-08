# Based upon https://github.com/the-nix-way/dev-templates
{
  description = "Basic flake for livemap-tiles development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      });

      unstable = import (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master) { config = { allowUnfree = true; }; };
    in
    {
      overlays.default = final: prev: {
        go = final."go_${toString goMajorVersion}_${toString goMinorVersion}";
      };

      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            python313

            python313Packages.gdal
          ];
        };
      });
    };

}
