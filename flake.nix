{
  description = "Home Manager configuration";

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

      mkPkgs =
        nixpkgs:
        import nixpkgs {
          inherit system;
          overlays = [ nixgl.overlay ];
          config.allowUnfree = true;
        };

      pkgs = mkPkgs nixpkgs;

      pkgs-unstable = mkPkgs nixpkgs-unstable;

      configs = import ./configs.nix;

      mkHome =
        profile:
        {
          username,
          homeDirectory,
          ...
        }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit
              profile
              nixgl
              pkgs-unstable
              stateVersion
              ;
          };

          modules = [
            ./home.nix

            {
              home = {
                inherit username homeDirectory stateVersion;
              };
            }
          ];
        };
    in
    {
      homeConfigurations = builtins.mapAttrs (profile: cfg: mkHome profile cfg) configs;

      templates = import ./templates/templates.nix;
    };
}
