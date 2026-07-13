{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = {
    shellApplication = pkgs.writeShellApplication {
      name = "pokemon";
      runtimeInputs = with pkgs; [
        # The final generated script has a like that export PATH with the nix store path of those runtime inputs. Thanks Nix!
        curl
        chafa
      ];
      text = ''
        curl -s ${config.pokemons.pikachu.url} \
        | chafa ${lib.concatStringsSep " " config.chafa.params}
      '';
    };

    chafa.params = [
      "--size=80x40"
    ];

    pokemons = import ./pokemons.nix;
  };
}
