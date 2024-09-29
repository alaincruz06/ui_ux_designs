import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_item_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_with_lang_domain.dart';

class PokemonAbilityDomain {
  PokemonAbilityDomain({
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

  final List<EffectChangeDomain> effectChanges;
  final List<EffectEntryDomain> effectEntries;
  final List<FlavorTextEntryDomain> flavorTextEntries;
  final PokemonNameAndUrlDomain? generation;
  final int? id;
  final bool? isMainSeries;
  final String? name;
  final List<PokemonNameWithLanguageDomain> names;
  final List<PokemonWithAbilityDomain> pokemon;

  @override
  String toString() {
    return "$effectChanges, $effectEntries, $flavorTextEntries, $generation, $id, $isMainSeries, $name, $names, $pokemon, ";
  }
}

class EffectChangeDomain {
  EffectChangeDomain({
    required this.effectEntries,
    required this.versionGroup,
  });

  final List<EffectEntryDomain> effectEntries;
  final PokemonNameAndUrlDomain? versionGroup;

  @override
  String toString() {
    return "$effectEntries, $versionGroup, ";
  }
}

class FlavorTextEntryDomain {
  FlavorTextEntryDomain({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });

  final String? flavorText;
  final PokemonNameAndUrlDomain? language;
  final PokemonNameAndUrlDomain? versionGroup;

  @override
  String toString() {
    return "$flavorText, $language, $versionGroup, ";
  }
}

class PokemonWithAbilityDomain {
  PokemonWithAbilityDomain({
    required this.isHidden,
    required this.pokemon,
    required this.slot,
  });

  final bool? isHidden;
  final PokemonNameAndUrlDomain? pokemon;
  final int? slot;

  @override
  String toString() {
    return "$isHidden, $pokemon, $slot, ";
  }
}
