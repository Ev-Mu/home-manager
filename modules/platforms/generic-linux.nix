{ pkgs, nixgl, ...}: {
  # automatically set some environment variables that
  # will ease usage of software installed with nix on 
  # non-NixOS linux (fixing local issues, settings XDG_DATA_DIRS, etc.)
  targets.genericLinux = {
    enable = true;
    # TODO: Get nixgl working properly on cachyos
    nixGL = {
      # Wrap GUI applications so Nix-built binaries can use host graphics drivers.
      packages = nixgl.packages;
      defaultWrapper = "mesa";
      installScripts = [ "mesa" ];
    };
  };
}
