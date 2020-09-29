{
  description = "A from-scratch X system tray implementation using xfce4-panel and na-tray as a reference";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          libcarbontray = pkgs.callPackage ./libcarbontray.nix { };
        };

        defaultPackage = self.packages.${system}.libcarbontray;
      }
    );
}
