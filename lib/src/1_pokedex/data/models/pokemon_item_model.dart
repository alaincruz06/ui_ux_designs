import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_with_lang_model.dart';

class PokemonItemModel {
  PokemonItemModel({
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

  final List<PokemonNameAndUrlModel> attributes;
  final dynamic babyTriggerFor;
  final PokemonNameAndUrlModel? category;
  final int? cost;
  final List<EffectEntryModel> effectEntries;
  final List<FlavorTextEntryModel> flavorTextEntries;
  final PokemonNameAndUrlModel? flingEffect;
  final int? flingPower;
  final List<GameIndexGenerationModel> gameIndices;
  final List<HeldByPokemonModel> heldByPokemon;
  final int? id;
  final List<dynamic> machines;
  final String? name;
  final List<PokemonNameWithLanguageModel> names;
  final SpritesOnlyDefaultModel? sprites;

  factory PokemonItemModel.fromJson(Map<String, dynamic> json) {
    return PokemonItemModel(
      attributes: json["attributes"] == null
          ? []
          : List<PokemonNameAndUrlModel>.from(json["attributes"]!
              .map((x) => PokemonNameAndUrlModel.fromJson(x))),
      babyTriggerFor: json["baby_trigger_for"],
      category: json["category"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["category"]),
      cost: json["cost"],
      effectEntries: json["effect_entries"] == null
          ? []
          : List<EffectEntryModel>.from(
              json["effect_entries"]!.map((x) => EffectEntryModel.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? []
          : List<FlavorTextEntryModel>.from(json["flavor_text_entries"]!
              .map((x) => FlavorTextEntryModel.fromJson(x))),
      flingEffect: json["fling_effect"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["fling_effect"]),
      flingPower: json["fling_power"],
      gameIndices: json["game_indices"] == null
          ? []
          : List<GameIndexGenerationModel>.from(json["game_indices"]!
              .map((x) => GameIndexGenerationModel.fromJson(x))),
      heldByPokemon: json["held_by_pokemon"] == null
          ? []
          : List<HeldByPokemonModel>.from(json["held_by_pokemon"]!
              .map((x) => HeldByPokemonModel.fromJson(x))),
      id: json["id"],
      machines: json["machines"] == null
          ? []
          : List<dynamic>.from(json["machines"]!.map((x) => x)),
      name: json["name"],
      names: json["names"] == null
          ? []
          : List<PokemonNameWithLanguageModel>.from(json["names"]!
              .map((x) => PokemonNameWithLanguageModel.fromJson(x))),
      sprites: json["sprites"] == null
          ? null
          : SpritesOnlyDefaultModel.fromJson(json["sprites"]),
    );
  }

  @override
  String toString() {
    return "$attributes, $babyTriggerFor, $category, $cost, $effectEntries, $flavorTextEntries, $flingEffect, $flingPower, $gameIndices, $heldByPokemon, $id, $machines, $name, $names, $sprites, ";
  }
}

class EffectEntryModel {
  EffectEntryModel({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  final String? effect;
  final PokemonNameAndUrlModel? language;
  final String? shortEffect;

  factory EffectEntryModel.fromJson(Map<String, dynamic> json) {
    return EffectEntryModel(
      effect: json["effect"],
      language: json["language"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["language"]),
      shortEffect: json["short_effect"],
    );
  }

  @override
  String toString() {
    return "$effect, $language, $shortEffect, ";
  }
}

class FlavorTextEntryModel {
  FlavorTextEntryModel({
    required this.language,
    required this.text,
    required this.versionGroup,
  });

  final PokemonNameAndUrlModel? language;
  final String? text;
  final PokemonNameAndUrlModel? versionGroup;

  factory FlavorTextEntryModel.fromJson(Map<String, dynamic> json) {
    return FlavorTextEntryModel(
      language: json["language"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["language"]),
      text: json["text"] ?? json["flavor_text"],
      versionGroup: json["version_group"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version_group"]),
    );
  }

  @override
  String toString() {
    return "$language, $text, $versionGroup, ";
  }
}

class GameIndexGenerationModel {
  GameIndexGenerationModel({
    required this.gameIndex,
    required this.generation,
  });

  final int? gameIndex;
  final PokemonNameAndUrlModel? generation;

  factory GameIndexGenerationModel.fromJson(Map<String, dynamic> json) {
    return GameIndexGenerationModel(
      gameIndex: json["game_index"],
      generation: json["generation"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["generation"]),
    );
  }

  @override
  String toString() {
    return "$gameIndex, $generation, ";
  }
}

class HeldByPokemonModel {
  HeldByPokemonModel({
    required this.pokemon,
    required this.versionDetails,
  });

  final PokemonNameAndUrlModel? pokemon;
  final List<VersionDetailModel> versionDetails;

  factory HeldByPokemonModel.fromJson(Map<String, dynamic> json) {
    return HeldByPokemonModel(
      pokemon: json["pokemon"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["pokemon"]),
      versionDetails: json["version_details"] == null
          ? []
          : List<VersionDetailModel>.from(json["version_details"]!
              .map((x) => VersionDetailModel.fromJson(x))),
    );
  }

  @override
  String toString() {
    return "$pokemon, $versionDetails, ";
  }
}

class SpritesOnlyDefaultModel {
  SpritesOnlyDefaultModel({
    required this.spritesDefault,
  });

  final String? spritesDefault;

  factory SpritesOnlyDefaultModel.fromJson(Map<String, dynamic> json) {
    return SpritesOnlyDefaultModel(
      spritesDefault: json["default"],
    );
  }

  @override
  String toString() {
    return "$spritesDefault, ";
  }
}
