{ lib, config, ... }:
let
  pokemonType = lib.types.submodule (
    { config, ... }: {
      options = {
        id = lib.mkOption {
          type = lib.types.int;
        };

        url = lib.mkOption {
          type = lib.types.str;
          default = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${toString config.id}.png";
        };
      };
    }
  );
in
{
  options = {
    shellApplication = lib.mkOption {
      type = lib.types.package;
    };

    chafa.params = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };

    pokemons = lib.mkOption {
      type = lib.types.attrsOf pokemonType;
    };
  };
}
