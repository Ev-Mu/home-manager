{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    # Keep Home Manager on the same nixpkgs revision as this flake.
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    nixvim.url = "github:nix-community/nixvim";
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixgl,
      nixvim,
      lazyvim,
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

      # Use unstable selectively while the main package set stays pinned.
      pkgs-unstable = mkPkgs nixpkgs-unstable;

      # Profile filenames define the public flake target names.
      profileDirectory = builtins.readDir ./profiles;
      profileNames = builtins.filter (name: builtins.match ".+\\.nix" name != null) (
        builtins.attrNames profileDirectory
      );

      mkHome =
        profile:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # These extra arguments are available to every imported module.
          extraSpecialArgs = {
            inherit
              nixgl
              pkgs-unstable
              stateVersion
              ;
          };

          modules = [
            ./home.nix
            (./profiles + "/${profile}.nix")

            nixvim.homeModules.nixvim
            lazyvim.homeManagerModules.default
          ];
        };
    in
    {
      # Each profiles/*.nix module becomes a named Home Manager flake target.
      homeConfigurations = builtins.listToAttrs (
        map (profile: {
          name = builtins.substring 0 (builtins.stringLength profile - 4) profile;
          value = mkHome (builtins.substring 0 (builtins.stringLength profile - 4) profile);
        }) profileNames
      );

      templates = import ./templates/templates.nix;
    };
}
