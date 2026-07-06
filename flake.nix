{
  description = "Home Manager configuration";

  # Flake inputs
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
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
      # The state version is required and should usually
      # stay at the version you originally installed.
      stateVersion = "26.05";

      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay ];
        config.allowUnfree = true;
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      mkHome =
        {
          profile,
          username,
          homeDirectory,
        }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit nixgl pkgs-unstable;
            inherit profile;
          };

          modules = [
            ./home.nix

            {
              home = {
                inherit username;
                inherit homeDirectory;
                stateVersion = "${stateVersion}";
              };
            }
          ];
        };
    in
    {
      homeConfigurations = {
        base = mkHome {
          profile = "base";
          username = "emusic";
          homeDirectory = "/home/emusic";
        };

        base-nixos = mkHome {
          profile = "base-nixos";
          username = "emusic";
          homeDirectory = "/home/emusic";
        };

        nixos = mkHome {
          profile = "nixos";
          username = "emusic";
          homeDirectory = "/home/emusic";
        };

        cachyos = mkHome {
          profile = "cachyos";
          username = "emusic";
          homeDirectory = "/home/emusic";
        };

        runner = mkHome {
          profile = "runner";
          username = "runner";
          homeDirectory = "/home/runner";
        };
      };

      templates = {
        go = {
          path = ./templates/go;
          description = "Go development environment";
        };
        npm = {
          path = ./templates/npm;
          description = "npm development environment";
        };
        python = {
          path = ./templates/python;
          description = "Python development environment";
        };
      };
    };
}
