{
  lib,
  config,
  pkgs,
  ...
}:
{
  pokemon.name = "charizard";

  shellApplication = pkgs.writeShellApplication {
    name = "pokemon";
    runtimeInputs = with pkgs; [
      curl
      chafa
    ];
    text = ''
      clear && \
      curl -s ${config.pokemons.${config.pokemon.name}.url} \
      | chafa ${lib.concatStringsSep " " config.chafa.params}
    '';
  };

  chafa.params = [
    "--size=30x15"
    "--align=center"
  ];

  pokemons = import ./pokemons.nix;
}
