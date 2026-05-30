{
  description = "Home Manager configuration";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixgl,
      ...
    }:
    let
      # The state version is required and should stay
      # at the version you originally installed.
      stateVersion = "25.11";

      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay ];
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
      };

      mkHome =
        { isGUI }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit nixgl pkgs-unstable;
            inherit isGUI;
          };

          modules = [
            ./home.nix

            {
              home = {
                username = "emusic";
                homeDirectory = "/home/emusic";
                stateVersion = "${stateVersion}";
              };
            }
          ];
        };
    in
    {
      homeConfigurations = {
        emusic = mkHome {
          isGUI = false;
        };

        emusic-gui = mkHome {
          isGUI = true;
        };

        runner = mkHome {
          isGUI = true;
        };
      };
    };
}
