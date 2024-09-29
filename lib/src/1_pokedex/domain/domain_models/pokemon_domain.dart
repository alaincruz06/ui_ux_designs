import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';

class PokemonDomain {
  PokemonDomain({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<PokemonAbilityWithNameUrlDomain> abilities;
  final int? baseExperience;
  final Cries? cries;
  final List<PokemonNameAndUrlModel> forms;
  final List<GameIndex> gameIndices;
  final int? height;
  final List<HeldItem> heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move> moves;
  final String? name;
  final int? order;
  final List<dynamic> pastAbilities;
  final List<dynamic> pastTypes;
  final PokemonNameAndUrlModel? species;
  final PokemonSpritesDomain? sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int? weight;
}

class PokemonAbilityWithNameUrlDomain {
  PokemonAbilityWithNameUrlDomain({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final PokemonNameAndUrlModel? ability;
  final bool? isHidden;
  final int? slot;
}

class Cries {
  Cries({
    required this.latest,
    required this.legacy,
  });

  final String? latest;
  final String? legacy;
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int? gameIndex;
  final PokemonNameAndUrlModel? version;
}

class HeldItem {
  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  final PokemonNameAndUrlModel? item;
  final List<VersionDetail> versionDetails;
}

class VersionDetail {
  VersionDetail({
    required this.rarity,
    required this.version,
  });

  final int? rarity;
  final PokemonNameAndUrlModel? version;
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final PokemonNameAndUrlModel? move;
  final List<VersionGroupDetail> versionGroupDetails;
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int? levelLearnedAt;
  final PokemonNameAndUrlModel? moveLearnMethod;
  final PokemonNameAndUrlModel? versionGroup;
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  final PokemonSpritesDomain? blackWhite;
}

class GenerationIV {
  GenerationIV({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final PokemonSpritesDomain? diamondPearl;
  final PokemonSpritesDomain? heartgoldSoulsilver;
  final PokemonSpritesDomain? platinum;
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIII,
    required this.generationIv,
    required this.generationV,
    required this.generationVI,
    required this.generationVII,
    required this.generationVIIi,
  });

  final GenerationI? generationI;
  final GenerationII? generationIi;
  final GenerationIII? generationIII;
  final GenerationIV? generationIv;
  final GenerationV? generationV;
  final Map<String, HomeDomain> generationVI;
  final GenerationVII? generationVII;
  final GenerationVIII? generationVIIi;
}

class Other {
  Other({
    required this.dreamWorld,
    required this.homeDomain,
    required this.officialArtwork,
    required this.showdown,
  });

  final DreamWorld? dreamWorld;
  final HomeDomain? homeDomain;
  final OfficialArtwork? officialArtwork;
  final PokemonSpritesDomain? showdown;
}

class PokemonSpritesDomain {
  PokemonSpritesDomain({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final PokemonSpritesDomain? animated;
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlue? redBlue;
  final RedBlue? yellow;
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backGray;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontGray;
  final String? frontTransparent;
}

class GenerationII {
  GenerationII({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final Crystal? crystal;
  final Gold? gold;
  final Gold? silver;
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backShiny;
  final String? backShinyTransparent;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontShinyTransparent;
  final String? frontTransparent;
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontTransparent;
}

class GenerationIII {
  GenerationIII({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final OfficialArtwork? emerald;
  final Gold? fireredLeafgreen;
  final Gold? rubySapphire;
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? frontDefault;
  final String? frontShiny;
}

class HomeDomain {
  HomeDomain({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
}

class GenerationVII {
  GenerationVII({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld? icons;
  final HomeDomain? ultraSunUltraMoon;
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;
}

class GenerationVIII {
  GenerationVIII({
    required this.icons,
  });

  final DreamWorld? icons;
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final PokemonNameAndUrlModel? stat;
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final PokemonNameAndUrlModel? type;
}
