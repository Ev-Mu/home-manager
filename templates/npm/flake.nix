{
  description = "Node.js development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          start = pkgs.writeShellApplication {
            name = "start";
            text = ''
              npm run dev
            '';
          };

          build = pkgs.writeShellApplication {
            name = "build";
            text = ''
              npm run build
            '';
          };

          test = pkgs.writeShellApplication {
            name = "test";
            text = ''
              npm test
            '';
          };

          lint = pkgs.writeShellApplication {
            name = "lint";
            text = ''
              npm run lint
            '';
          };
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.nodejs_24
              start
              build
              test
              lint
            ];

            shellHook = ''
              echo "Node $(node --version)"
              echo "npm  $(npm --version)"
            '';
          };
        }
      );
    };
}
