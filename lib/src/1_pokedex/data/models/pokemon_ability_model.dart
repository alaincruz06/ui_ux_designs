import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_item_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_with_lang_model.dart';

class PokemonAbilityModel {
  PokemonAbilityModel({
    required this.effectChanges,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.generation,
    required this.id,
    required this.isMainSeries,
    required this.name,
    required this.names,
    required this.pokemon,
  });

  final List<EffectChangeModel> effectChanges;
  final List<EffectEntryModel> effectEntries;
  final List<FlavorTextEntryModel> flavorTextEntries;
  final PokemonNameAndUrlModel? generation;
  final int? id;
  final bool? isMainSeries;
  final String? name;
  final List<PokemonNameWithLanguageModel> names;
  final List<PokemonWithAbilityModel> pokemon;

  factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      effectChanges: json["effect_changes"] == null
          ? []
          : List<EffectChangeModel>.from(json["effect_changes"]!
              .map((x) => EffectChangeModel.fromJson(x))),
      effectEntries: json["effect_entries"] == null
          ? []
          : List<EffectEntryModel>.from(
              json["effect_entries"]!.map((x) => EffectEntryModel.fromJson(x))),
      flavorTextEntries: json["flavor_text_entries"] == null
          ? []
          : List<FlavorTextEntryModel>.from(json["flavor_text_entries"]!
              .map((x) => FlavorTextEntryModel.fromJson(x))),
      generation: json["generation"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["generation"]),
      id: json["id"],
      isMainSeries: json["is_main_series"],
      name: json["name"],
      names: json["names"] == null
          ? []
          : List<PokemonNameWithLanguageModel>.from(json["names"]!
              .map((x) => PokemonNameWithLanguageModel.fromJson(x))),
      pokemon: json["pokemon"] == null
          ? []
          : List<PokemonWithAbilityModel>.from(
              json["pokemon"]!.map((x) => PokemonWithAbilityModel.fromJson(x))),
    );
  }

  @override
  String toString() {
    return "$effectChanges, $effectEntries, $flavorTextEntries, $generation, $id, $isMainSeries, $name, $names, $pokemon, ";
  }
}

class EffectChangeModel {
  EffectChangeModel({
    required this.effectEntries,
    required this.versionGroup,
  });

  final List<EffectEntryModel> effectEntries;
  final PokemonNameAndUrlModel? versionGroup;

  factory EffectChangeModel.fromJson(Map<String, dynamic> json) {
    return EffectChangeModel(
      effectEntries: json["effect_entries"] == null
          ? []
          : List<EffectEntryModel>.from(
              json["effect_entries"]!.map((x) => EffectEntryModel.fromJson(x))),
      versionGroup: json["version_group"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version_group"]),
    );
  }

  @override
  String toString() {
    return "$effectEntries, $versionGroup, ";
  }
}

class PokemonWithAbilityModel {
  PokemonWithAbilityModel({
    required this.isHidden,
    required this.pokemon,
    required this.slot,
  });

  final bool? isHidden;
  final PokemonNameAndUrlModel? pokemon;
  final int? slot;

  factory PokemonWithAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonWithAbilityModel(
      isHidden: json["is_hidden"],
      pokemon: json["pokemon"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["pokemon"]),
      slot: json["slot"],
    );
  }

  @override
  String toString() {
    return "$isHidden, $pokemon, $slot, ";
  }
}
