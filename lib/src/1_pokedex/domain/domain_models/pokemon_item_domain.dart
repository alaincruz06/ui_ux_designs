import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_ability_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_with_lang_domain.dart';

class PokemonItemDomain {
  PokemonItemDomain({
    required this.attributes,
    required this.babyTriggerFor,
    required this.category,
    required this.cost,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.flingEffect,
    required this.flingPower,
    required this.gameIndices,
    required this.heldByPokemon,
    required this.id,
    required this.machines,
    required this.name,
    required this.names,
    required this.sprites,
  });

  final List<PokemonNameAndUrlDomain> attributes;
  final dynamic babyTriggerFor;
  final PokemonNameAndUrlDomain? category;
  final int? cost;
  final List<EffectEntryDomain> effectEntries;
  final List<FlavorTextEntryDomain> flavorTextEntries;
  final PokemonNameAndUrlDomain? flingEffect;
  final int? flingPower;
  final List<GameIndexGenerationDomain> gameIndices;
  final List<HeldByPokemonDomain> heldByPokemon;
  final int? id;
  final List<dynamic> machines;
  final String? name;
  final List<PokemonNameWithLanguageDomain> names;
  final SpritesOnlyDefaultDomain? sprites;

  @override
  String toString() {
    return "$attributes, $babyTriggerFor, $category, $cost, $effectEntries, $flavorTextEntries, $flingEffect, $flingPower, $gameIndices, $heldByPokemon, $id, $machines, $name, $names, $sprites, ";
  }
}

class EffectEntryDomain {
  EffectEntryDomain({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  final String? effect;
  final PokemonNameAndUrlDomain? language;
  final String? shortEffect;

  @override
  String toString() {
    return "$effect, $language, $shortEffect, ";
  }
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.language,
    required this.text,
    required this.versionGroup,
  });

  final PokemonNameAndUrlDomain? language;
  final String? text;
  final PokemonNameAndUrlDomain? versionGroup;

  @override
  String toString() {
    return "$language, $text, $versionGroup, ";
  }
}

class GameIndexGenerationDomain {
  GameIndexGenerationDomain({
    required this.gameIndex,
    required this.generation,
  });

  final int? gameIndex;
  final PokemonNameAndUrlDomain? generation;

  @override
  String toString() {
    return "$gameIndex, $generation, ";
  }
}

class HeldByPokemonDomain {
  HeldByPokemonDomain({
    required this.pokemon,
    required this.versionDetails,
  });

  final PokemonNameAndUrlDomain? pokemon;
  final List<VersionDetailDomain> versionDetails;

  @override
  String toString() {
    return "$pokemon, $versionDetails, ";
  }
}

class VersionDetailDomain {
  VersionDetailDomain({
    required this.rarity,
    required this.version,
  });

  final int? rarity;
  final PokemonNameAndUrlDomain? version;

  @override
  String toString() {
    return "$rarity, $version, ";
  }
}

class SpritesOnlyDefaultDomain {
  SpritesOnlyDefaultDomain({
    required this.spritesDefault,
  });

  final String? spritesDefault;

  @override
  String toString() {
    return "$spritesDefault, ";
  }
}
