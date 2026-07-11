{
  description = "C++ development environment";

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
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.clang
              pkgs.clang-tools
              pkgs.cmake
              pkgs.ninja
              pkgs.gdb
              pkgs.pkg-config
            ];

            shellHook = ''
              echo "GCC $(gcc --version | head -n1)"
              echo "Clang $(clang --version | head -n1)"
              echo "CMake $(cmake --version | head -n1)"
            '';
          };
        }
      );
    };
}
