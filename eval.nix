let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-26.05";
  pkgs = import nixpkgs {
    config = { };
    overlays = [ ];
  };
in
pkgs.lib.evalModules {
  specialArgs = {
    inherit pkgs;
  };
  modules = [
    ./default.nix
  ];
}
