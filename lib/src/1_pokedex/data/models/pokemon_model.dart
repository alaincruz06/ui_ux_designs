import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';

class PokemonModel {
  PokemonModel({
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
    required this.pastType,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<PokemonAbilityWithNameUrlModel> abilities;
  final int? baseExperience;
  final CriesModel? cries;
  final List<PokemonNameAndUrlModel> forms;
  final List<GameIndexVersionModel> gameIndices;
  final int? height;
  final List<HeldItemModel> heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<MoveModel> moves;
  final String? name;
  final int? order;
  final List<dynamic> pastAbilities;
  final List<dynamic> pastType;
  final PokemonNameAndUrlModel? species;
  final PokemonSpritesModel? sprites;
  final List<StatModel> stats;
  final List<TypeModel> types;
  final int? weight;

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      abilities: json["abilities"] == null
          ? []
          : List<PokemonAbilityWithNameUrlModel>.from(json["abilities"]!
              .map((x) => PokemonAbilityWithNameUrlModel.fromJson(x))),
      baseExperience: json["base_experience"],
      cries: json["cries"] == null ? null : CriesModel.fromJson(json["cries"]),
      forms: json["forms"] == null
          ? []
          : List<PokemonNameAndUrlModel>.from(
              json["forms"]!.map((x) => PokemonNameAndUrlModel.fromJson(x))),
      gameIndices: json["game_indices"] == null
          ? []
          : List<GameIndexVersionModel>.from(json["game_indices"]!
              .map((x) => GameIndexVersionModel.fromJson(x))),
      height: json["height"],
      heldItems: json["held_items"] == null
          ? []
          : List<HeldItemModel>.from(
              json["held_items"]!.map((x) => HeldItemModel.fromJson(x))),
      id: json["id"],
      isDefault: json["is_default"],
      locationAreaEncounters: json["location_area_encounters"],
      moves: json["moves"] == null
          ? []
          : List<MoveModel>.from(
              json["moves"]!.map((x) => MoveModel.fromJson(x))),
      name: json["name"],
      order: json["order"],
      pastAbilities: json["past_abilities"] == null
          ? []
          : List<dynamic>.from(json["past_abilities"]!.map((x) => x)),
      pastType: json["past_types"] == null
          ? []
          : List<dynamic>.from(json["past_types"]!.map((x) => x)),
      species: json["species"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["species"]),
      sprites: json["sprites"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["sprites"]),
      stats: json["stats"] == null
          ? []
          : List<StatModel>.from(
              json["stats"]!.map((x) => StatModel.fromJson(x))),
      types: json["types"] == null
          ? []
          : List<TypeModel>.from(
              json["types"]!.map((x) => TypeModel.fromJson(x))),
      weight: json["weight"],
    );
  }
}

class PokemonAbilityWithNameUrlModel {
  PokemonAbilityWithNameUrlModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final PokemonNameAndUrlModel? ability;
  final bool? isHidden;
  final int? slot;

  factory PokemonAbilityWithNameUrlModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityWithNameUrlModel(
      ability: json["ability"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["ability"]),
      isHidden: json["is_hidden"],
      slot: json["slot"],
    );
  }
}

class CriesModel {
  CriesModel({
    required this.latest,
    required this.legacy,
  });

  final String? latest;
  final String? legacy;

  factory CriesModel.fromJson(Map<String, dynamic> json) {
    return CriesModel(
      latest: json["latest"],
      legacy: json["legacy"],
    );
  }
}

class GameIndexVersionModel {
  GameIndexVersionModel({
    required this.gameIndex,
    required this.version,
  });

  final int? gameIndex;
  final PokemonNameAndUrlModel? version;

  factory GameIndexVersionModel.fromJson(Map<String, dynamic> json) {
    return GameIndexVersionModel(
      gameIndex: json["game_index"],
      version: json["version"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version"]),
    );
  }
}

class HeldItemModel {
  HeldItemModel({
    required this.item,
    required this.versionDetails,
  });

  final PokemonNameAndUrlModel? item;
  final List<VersionDetailModel> versionDetails;

  factory HeldItemModel.fromJson(Map<String, dynamic> json) {
    return HeldItemModel(
      item: json["item"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["item"]),
      versionDetails: json["version_details"] == null
          ? []
          : List<VersionDetailModel>.from(json["version_details"]!
              .map((x) => VersionDetailModel.fromJson(x))),
    );
  }
}

class VersionDetailModel {
  VersionDetailModel({
    required this.rarity,
    required this.version,
  });

  final int? rarity;
  final PokemonNameAndUrlModel? version;

  factory VersionDetailModel.fromJson(Map<String, dynamic> json) {
    return VersionDetailModel(
      rarity: json["rarity"],
      version: json["version"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version"]),
    );
  }
}

class MoveModel {
  MoveModel({
    required this.move,
    required this.versionGroupDetails,
  });

  final PokemonNameAndUrlModel? move;
  final List<VersionGroupDetailModel> versionGroupDetails;

  factory MoveModel.fromJson(Map<String, dynamic> json) {
    return MoveModel(
      move: json["move"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["move"]),
      versionGroupDetails: json["version_group_details"] == null
          ? []
          : List<VersionGroupDetailModel>.from(json["version_group_details"]!
              .map((x) => VersionGroupDetailModel.fromJson(x))),
    );
  }
}

class VersionGroupDetailModel {
  VersionGroupDetailModel({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int? levelLearnedAt;
  final PokemonNameAndUrlModel? moveLearnMethod;
  final PokemonNameAndUrlModel? versionGroup;

  factory VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetailModel(
      levelLearnedAt: json["level_learned_at"],
      moveLearnMethod: json["move_learn_method"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["move_learn_method"]),
      versionGroup: json["version_group"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version_group"]),
    );
  }
}

class GenerationVModel {
  GenerationVModel({
    required this.blackWhite,
  });

  final PokemonSpritesModel? blackWhite;

  factory GenerationVModel.fromJson(Map<String, dynamic> json) {
    return GenerationVModel(
      blackWhite: json["black-white"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["black-white"]),
    );
  }
}

class GenerationIVModel {
  GenerationIVModel({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final PokemonSpritesModel? diamondPearl;
  final PokemonSpritesModel? heartgoldSoulsilver;
  final PokemonSpritesModel? platinum;

  factory GenerationIVModel.fromJson(Map<String, dynamic> json) {
    return GenerationIVModel(
      diamondPearl: json["diamond-pearl"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["diamond-pearl"]),
      heartgoldSoulsilver: json["heartgold-soulsilver"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["heartgold-soulsilver"]),
      platinum: json["platinum"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["platinum"]),
    );
  }
}

class VersionsModel {
  VersionsModel({
    required this.generationI,
    required this.generationIi,
    required this.generationIII,
    required this.generationIv,
    required this.generationV,
    required this.generationVI,
    required this.generationVII,
    required this.generationVIII,
  });

  final GenerationIModel? generationI;
  final GenerationIIModel? generationIi;
  final GenerationIIIModel? generationIII;
  final GenerationIVModel? generationIv;
  final GenerationVModel? generationV;
  final Map<String, HomeModel> generationVI;
  final GenerationVIIModel? generationVII;
  final GenerationVIIIModel? generationVIII;

  factory VersionsModel.fromJson(Map<String, dynamic> json) {
    return VersionsModel(
      generationI: json["generation-i"] == null
          ? null
          : GenerationIModel.fromJson(json["generation-i"]),
      generationIi: json["generation-ii"] == null
          ? null
          : GenerationIIModel.fromJson(json["generation-ii"]),
      generationIII: json["generation-iii"] == null
          ? null
          : GenerationIIIModel.fromJson(json["generation-iii"]),
      generationIv: json["generation-iv"] == null
          ? null
          : GenerationIVModel.fromJson(json["generation-iv"]),
      generationV: json["generation-v"] == null
          ? null
          : GenerationVModel.fromJson(json["generation-v"]),
      generationVI: Map.from(json["generation-vi"])
          .map((k, v) => MapEntry<String, HomeModel>(k, HomeModel.fromJson(v))),
      generationVII: json["generation-vii"] == null
          ? null
          : GenerationVIIModel.fromJson(json["generation-vii"]),
      generationVIII: json["generation-viii"] == null
          ? null
          : GenerationVIIIModel.fromJson(json["generation-viii"]),
    );
  }
}

class OtherModel {
  OtherModel({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  final DreamWorldModel? dreamWorld;
  final HomeModel? home;
  final OfficialArtworkModel? officialArtwork;
  final PokemonSpritesModel? showdown;

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      dreamWorld: json["dream_world"] == null
          ? null
          : DreamWorldModel.fromJson(json["dream_world"]),
      home: json["home"] == null ? null : HomeModel.fromJson(json["home"]),
      officialArtwork: json["official-artwork"] == null
          ? null
          : OfficialArtworkModel.fromJson(json["official-artwork"]),
      showdown: json["showdown"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["showdown"]),
    );
  }
}

class PokemonSpritesModel {
  PokemonSpritesModel({
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
  final OtherModel? other;
  final VersionsModel? versions;
  final PokemonSpritesModel? animated;

  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpritesModel(
      backDefault: json["back_default"],
      backFemale: json["back_female"],
      backShiny: json["back_shiny"],
      backShinyFemale: json["back_shiny_female"],
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
      other: json["other"] == null ? null : OtherModel.fromJson(json["other"]),
      versions: json["versions"] == null
          ? null
          : VersionsModel.fromJson(json["versions"]),
      animated: json["animated"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["animated"]),
    );
  }
}

class GenerationIModel {
  GenerationIModel({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlueModel? redBlue;
  final RedBlueModel? yellow;

  factory GenerationIModel.fromJson(Map<String, dynamic> json) {
    return GenerationIModel(
      redBlue: json["red-blue"] == null
          ? null
          : RedBlueModel.fromJson(json["red-blue"]),
      yellow:
          json["yellow"] == null ? null : RedBlueModel.fromJson(json["yellow"]),
    );
  }
}

class RedBlueModel {
  RedBlueModel({
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

  factory RedBlueModel.fromJson(Map<String, dynamic> json) {
    return RedBlueModel(
      backDefault: json["back_default"],
      backGray: json["back_gray"],
      backTransparent: json["back_transparent"],
      frontDefault: json["front_default"],
      frontGray: json["front_gray"],
      frontTransparent: json["front_transparent"],
    );
  }
}

class GenerationIIModel {
  GenerationIIModel({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final CrystalModel? crystal;
  final GoldModel? gold;
  final GoldModel? silver;

  factory GenerationIIModel.fromJson(Map<String, dynamic> json) {
    return GenerationIIModel(
      crystal: json["crystal"] == null
          ? null
          : CrystalModel.fromJson(json["crystal"]),
      gold: json["gold"] == null ? null : GoldModel.fromJson(json["gold"]),
      silver:
          json["silver"] == null ? null : GoldModel.fromJson(json["silver"]),
    );
  }
}

class CrystalModel {
  CrystalModel({
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

  factory CrystalModel.fromJson(Map<String, dynamic> json) {
    return CrystalModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      backShinyTransparent: json["back_shiny_transparent"],
      backTransparent: json["back_transparent"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      frontShinyTransparent: json["front_shiny_transparent"],
      frontTransparent: json["front_transparent"],
    );
  }
}

class GoldModel {
  GoldModel({
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

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      backDefault: json["back_default"],
      backShiny: json["back_shiny"],
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
      frontTransparent: json["front_transparent"],
    );
  }
}

class GenerationIIIModel {
  GenerationIIIModel({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final OfficialArtworkModel? emerald;
  final GoldModel? fireredLeafgreen;
  final GoldModel? rubySapphire;

  factory GenerationIIIModel.fromJson(Map<String, dynamic> json) {
    return GenerationIIIModel(
      emerald: json["emerald"] == null
          ? null
          : OfficialArtworkModel.fromJson(json["emerald"]),
      fireredLeafgreen: json["firered-leafgreen"] == null
          ? null
          : GoldModel.fromJson(json["firered-leafgreen"]),
      rubySapphire: json["ruby-sapphire"] == null
          ? null
          : GoldModel.fromJson(json["ruby-sapphire"]),
    );
  }
}

class OfficialArtworkModel {
  OfficialArtworkModel({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? frontDefault;
  final String? frontShiny;

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json["front_default"],
      frontShiny: json["front_shiny"],
    );
  }
}

class HomeModel {
  HomeModel({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
      frontShiny: json["front_shiny"],
      frontShinyFemale: json["front_shiny_female"],
    );
  }
}

class GenerationVIIModel {
  GenerationVIIModel({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorldModel? icons;
  final HomeModel? ultraSunUltraMoon;

  factory GenerationVIIModel.fromJson(Map<String, dynamic> json) {
    return GenerationVIIModel(
      icons: json["icons"] == null
          ? null
          : DreamWorldModel.fromJson(json["icons"]),
      ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
          ? null
          : HomeModel.fromJson(json["ultra-sun-ultra-moon"]),
    );
  }
}

class DreamWorldModel {
  DreamWorldModel({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) {
    return DreamWorldModel(
      frontDefault: json["front_default"],
      frontFemale: json["front_female"],
    );
  }
}

class GenerationVIIIModel {
  GenerationVIIIModel({
    required this.icons,
  });

  final DreamWorldModel? icons;

  factory GenerationVIIIModel.fromJson(Map<String, dynamic> json) {
    return GenerationVIIIModel(
      icons: json["icons"] == null
          ? null
          : DreamWorldModel.fromJson(json["icons"]),
    );
  }
}

class StatModel {
  StatModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final PokemonNameAndUrlModel? stat;

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      baseStat: json["base_stat"],
      effort: json["effort"],
      stat: json["stat"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["stat"]),
    );
  }
}

class TypeModel {
  TypeModel({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final PokemonNameAndUrlModel? type;

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      slot: json["slot"],
      type: json["type"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["type"]),
    );
  }
}
