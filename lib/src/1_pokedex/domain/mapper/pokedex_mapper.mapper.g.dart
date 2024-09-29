// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class PokedexMapperImpl extends PokedexMapper {
  PokedexMapperImpl() : super();

  @override
  PokemonAbilityDomain pokemonAbilityDomainByPokemonAbilityModel(
      PokemonAbilityModel pokemonAbilityModel) {
    final pokemonabilitydomain = PokemonAbilityDomain(
      effectChanges: pokemonAbilityModel.effectChanges
          .map((x) => effectChangeDomainByEffectChangeModel(x))
          .toList(),
      effectEntries: pokemonAbilityModel.effectEntries
          .map((x) => effectEntryDomainByEffectEntryModel(x))
          .toList(),
      flavorTextEntries: pokemonAbilityModel.flavorTextEntries
          .map((x) => flavorTextEntryDomainByFlavorTextEntryModel(x))
          .toList(),
      generation: pokemonAbilityModel.generation == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonAbilityModel.generation!),
      id: pokemonAbilityModel.id,
      isMainSeries: pokemonAbilityModel.isMainSeries,
      name: pokemonAbilityModel.name,
      names: pokemonAbilityModel.names
          .map((x) =>
              pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(x))
          .toList(),
      pokemon: pokemonAbilityModel.pokemon
          .map((e) => pokemonWithAbilityDomainByPokemonWithAbilityModel(e))
          .toList(),
    );
    return pokemonabilitydomain;
  }

  @override
  EffectChangeDomain effectChangeDomainByEffectChangeModel(
      EffectChangeModel effectChangeModel) {
    final effectchangedomain = EffectChangeDomain(
      effectEntries: effectChangeModel.effectEntries
          .map((x) => effectEntryDomainByEffectEntryModel(x))
          .toList(),
      versionGroup: effectChangeModel.versionGroup == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              effectChangeModel.versionGroup!),
    );
    return effectchangedomain;
  }

  @override
  FlavorTextEntryDomain flavorTextEntryDomainByFlavorTextEntryModel(
      FlavorTextEntryModel flavorTextEntryModel) {
    final flavortextentrydomain = FlavorTextEntryDomain(
      flavorText: flavorTextEntryModel.text,
      language: flavorTextEntryModel.language == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              flavorTextEntryModel.language!),
      versionGroup: flavorTextEntryModel.versionGroup == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              flavorTextEntryModel.versionGroup!),
    );
    return flavortextentrydomain;
  }

  @override
  PokemonWithAbilityDomain pokemonWithAbilityDomainByPokemonWithAbilityModel(
      PokemonWithAbilityModel pokemonWithAbilityModel) {
    final pokemonwithabilitydomain = PokemonWithAbilityDomain(
      isHidden: pokemonWithAbilityModel.isHidden,
      pokemon: pokemonWithAbilityModel.pokemon == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonWithAbilityModel.pokemon!),
      slot: pokemonWithAbilityModel.slot,
    );
    return pokemonwithabilitydomain;
  }

  @override
  PokemonFormDomain pokemonFormDomainByPokemonFormModel(
      PokemonFormModel pokemonFormModel) {
    final pokemonformdomain = PokemonFormDomain(
      formName: pokemonFormModel.formName,
      formNames: pokemonFormModel.formNames
          .map((x) =>
              pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(x))
          .toList(),
      formOrder: pokemonFormModel.formOrder,
      id: pokemonFormModel.id,
      isBattleOnly: pokemonFormModel.isBattleOnly,
      isDefault: pokemonFormModel.isDefault,
      isMega: pokemonFormModel.isMega,
      name: pokemonFormModel.name,
      names: pokemonFormModel.names
          .map((x) =>
              pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(x))
          .toList(),
      order: pokemonFormModel.order,
      pokemon: pokemonFormModel.pokemon == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonFormModel.pokemon!),
      sprites: pokemonFormModel.sprites == null
          ? null
          : spritesBySpritesModel(pokemonFormModel.sprites!),
      types: pokemonFormModel.types
          .map((x) => formTypeDomainByFormTypeModel(x))
          .toList(),
      versionGroup: pokemonFormModel.versionGroup == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonFormModel.versionGroup!),
    );
    return pokemonformdomain;
  }

  @override
  FormTypeDomain formTypeDomainByFormTypeModel(FormTypeModel formTypeModel) {
    final formtypedomain = FormTypeDomain(
      slot: formTypeModel.slot,
      type: formTypeModel.type == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              formTypeModel.type!),
    );
    return formtypedomain;
  }

  @override
  PokemonItemDomain pokemonItemDomainByPokemonItemModel(
      PokemonItemModel pokemonItemModel) {
    final pokemonitemdomain = PokemonItemDomain(
      attributes: pokemonItemModel.attributes
          .map((x) => pokemonNameAndUrlDomainByPokemonNameAndUrlModel(x))
          .toList(),
      babyTriggerFor: pokemonItemModel.babyTriggerFor,
      category: pokemonItemModel.category == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonItemModel.category!),
      cost: pokemonItemModel.cost,
      effectEntries: pokemonItemModel.effectEntries
          .map((x) => effectEntryDomainByEffectEntryModel(x))
          .toList(),
      flavorTextEntries: pokemonItemModel.flavorTextEntries
          .map((e) => flavorTextEntryDomainByFlavorTextEntryModel(e))
          .toList(),
      flingEffect: pokemonItemModel.flingEffect == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonItemModel.flingEffect!),
      flingPower: pokemonItemModel.flingPower,
      gameIndices: pokemonItemModel.gameIndices
          .map((x) => gameIndexGenerationDomainByGameIndexGenerationModel(x))
          .toList(),
      heldByPokemon: pokemonItemModel.heldByPokemon
          .map((x) => heldByPokemonDomainByHeldByPokemonModel(x))
          .toList(),
      id: pokemonItemModel.id,
      machines: pokemonItemModel.machines.map((e) => e).toList(),
      name: pokemonItemModel.name,
      names: pokemonItemModel.names
          .map((x) =>
              pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(x))
          .toList(),
      sprites: pokemonItemModel.sprites == null
          ? null
          : spritesOnlyDefaultDomainBySpritesOnlyDefaultModel(
              pokemonItemModel.sprites!),
    );
    return pokemonitemdomain;
  }

  @override
  EffectEntryDomain effectEntryDomainByEffectEntryModel(
      EffectEntryModel effectEntryModel) {
    final effectentrydomain = EffectEntryDomain(
      effect: effectEntryModel.effect,
      language: effectEntryModel.language == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              effectEntryModel.language!),
      shortEffect: effectEntryModel.shortEffect,
    );
    return effectentrydomain;
  }

  @override
  GameIndexGenerationDomain gameIndexGenerationDomainByGameIndexGenerationModel(
      GameIndexGenerationModel gameIndexGenerationModel) {
    final gameindexgenerationdomain = GameIndexGenerationDomain(
      gameIndex: gameIndexGenerationModel.gameIndex,
      generation: gameIndexGenerationModel.generation == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              gameIndexGenerationModel.generation!),
    );
    return gameindexgenerationdomain;
  }

  @override
  HeldByPokemonDomain heldByPokemonDomainByHeldByPokemonModel(
      HeldByPokemonModel heldByPokemonModel) {
    final heldbypokemondomain = HeldByPokemonDomain(
      pokemon: heldByPokemonModel.pokemon == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              heldByPokemonModel.pokemon!),
      versionDetails: heldByPokemonModel.versionDetails
          .map((x) => versionDetailDomainByVersionDetailModel(x))
          .toList(),
    );
    return heldbypokemondomain;
  }

  @override
  SpritesOnlyDefaultDomain spritesOnlyDefaultDomainBySpritesOnlyDefaultModel(
      SpritesOnlyDefaultModel spritesOnlyDefaultModel) {
    final spritesonlydefaultdomain = SpritesOnlyDefaultDomain(
        spritesDefault: spritesOnlyDefaultModel.spritesDefault);
    return spritesonlydefaultdomain;
  }

  @override
  PokemonListDomain pokemonListDomainByPokemonListModel(
      PokemonListModel pokemonListModel) {
    final pokemonlistdomain = PokemonListDomain(
      count: pokemonListModel.count,
      next: pokemonListModel.next,
      previous: pokemonListModel.previous,
      results: pokemonListModel.results
          .map((x) => pokemonNameAndUrlDomainByPokemonNameAndUrlModel(x))
          .toList(),
    );
    return pokemonlistdomain;
  }

  @override
  PokemonDomain pokemonDomainByPokemonModel(PokemonModel pokemonModel) {
    final pokemondomain = PokemonDomain(
      pastTypes: pokemonModel.pastType,
      abilities:
          pokemonModel.abilities.map((x) => abilityByAbilityModel(x)).toList(),
      baseExperience: pokemonModel.baseExperience,
      cries: pokemonModel.cries == null
          ? null
          : criesByCriesModel(pokemonModel.cries!),
      forms: pokemonModel.forms.map((e) => e).toList(),
      gameIndices: pokemonModel.gameIndices
          .map((x) => gameIndexByGameIndexModel(x))
          .toList(),
      height: pokemonModel.height,
      heldItems: pokemonModel.heldItems
          .map((x) => heldItemByHeldItemModel(x))
          .toList(),
      id: pokemonModel.id,
      isDefault: pokemonModel.isDefault,
      locationAreaEncounters: pokemonModel.locationAreaEncounters,
      moves: pokemonModel.moves.map((x) => moveByMoveModel(x)).toList(),
      name: pokemonModel.name,
      order: pokemonModel.order,
      pastAbilities: pokemonModel.pastAbilities.map((e) => e).toList(),
      species: pokemonModel.species,
      sprites: pokemonModel.sprites == null
          ? null
          : spritesBySpritesModel(pokemonModel.sprites!),
      stats: pokemonModel.stats.map((x) => statByStatModel(x)).toList(),
      types: pokemonModel.types.map((x) => typeByTypeModel(x)).toList(),
      weight: pokemonModel.weight,
    );
    return pokemondomain;
  }

  @override
  VersionDetailDomain versionDetailDomainByVersionDetailModel(
      VersionDetailModel versionDetailModel) {
    final versiondetaildomain = VersionDetailDomain(
      rarity: versionDetailModel.rarity,
      version: versionDetailModel.version == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              versionDetailModel.version!),
    );
    return versiondetaildomain;
  }

  @override
  PokemonAbilityWithNameUrlDomain abilityByAbilityModel(
      PokemonAbilityWithNameUrlModel abilityModel) {
    final pokemonabilitywithnameurldomain = PokemonAbilityWithNameUrlDomain(
      ability: abilityModel.ability,
      isHidden: abilityModel.isHidden,
      slot: abilityModel.slot,
    );
    return pokemonabilitywithnameurldomain;
  }

  @override
  Cries criesByCriesModel(CriesModel criesModel) {
    final cries = Cries(
      latest: criesModel.latest,
      legacy: criesModel.legacy,
    );
    return cries;
  }

  @override
  GameIndex gameIndexByGameIndexModel(
      GameIndexVersionModel gameIndexVersionModel) {
    final gameindex = GameIndex(
      gameIndex: gameIndexVersionModel.gameIndex,
      version: gameIndexVersionModel.version,
    );
    return gameindex;
  }

  @override
  HeldItem heldItemByHeldItemModel(HeldItemModel heldItemModel) {
    final helditem = HeldItem(
      item: heldItemModel.item,
      versionDetails: heldItemModel.versionDetails
          .map((x) => versionDetailByVersionDetailModel(x))
          .toList(),
    );
    return helditem;
  }

  @override
  VersionDetail versionDetailByVersionDetailModel(
      VersionDetailModel versionDetailModel) {
    final versiondetail = VersionDetail(
      rarity: versionDetailModel.rarity,
      version: versionDetailModel.version,
    );
    return versiondetail;
  }

  @override
  HomeDomain homeDomainByHomeModel(HomeModel moveModel) {
    final homedomain = HomeDomain(
      frontDefault: moveModel.frontDefault,
      frontFemale: moveModel.frontFemale,
      frontShiny: moveModel.frontShiny,
      frontShinyFemale: moveModel.frontShinyFemale,
    );
    return homedomain;
  }

  @override
  DreamWorld dreamWorldByDreamWorldModel(DreamWorldModel dreamWorldModel) {
    final dreamworld = DreamWorld(
      frontDefault: dreamWorldModel.frontDefault,
      frontFemale: dreamWorldModel.frontFemale,
    );
    return dreamworld;
  }

  @override
  OfficialArtwork officialArtworkByOfficialArtworkModel(
      OfficialArtworkModel officialArtworkModel) {
    final officialartwork = OfficialArtwork(
      frontDefault: officialArtworkModel.frontDefault,
      frontShiny: officialArtworkModel.frontShiny,
    );
    return officialartwork;
  }

  @override
  Move moveByMoveModel(MoveModel moveModel) {
    final move = Move(
      move: moveModel.move,
      versionGroupDetails: moveModel.versionGroupDetails
          .map((x) => versionGroupDetailByVersionGroupDetailModel(x))
          .toList(),
    );
    return move;
  }

  @override
  VersionGroupDetail versionGroupDetailByVersionGroupDetailModel(
      VersionGroupDetailModel versionGroupDetailModel) {
    final versiongroupdetail = VersionGroupDetail(
      levelLearnedAt: versionGroupDetailModel.levelLearnedAt,
      moveLearnMethod: versionGroupDetailModel.moveLearnMethod,
      versionGroup: versionGroupDetailModel.versionGroup,
    );
    return versiongroupdetail;
  }

  @override
  Versions versionsByVersionsModel(VersionsModel versionsModel) {
    final versions = Versions(
      generationI: versionsModel.generationI == null
          ? null
          : generationIByGenerationIModel(versionsModel.generationI!),
      generationIi: versionsModel.generationIi == null
          ? null
          : generationIIByGenerationIIModel(versionsModel.generationIi!),
      generationIII: versionsModel.generationIII == null
          ? null
          : generationIIIByGenerationIIIIModel(versionsModel.generationIII!),
      generationIv: versionsModel.generationIv == null
          ? null
          : generationIvByGenerationIVModel(versionsModel.generationIv!),
      generationV: versionsModel.generationV == null
          ? null
          : generationVByGenerationVModel(versionsModel.generationV!),
      generationVI: versionsModel.generationVI.map(
        (key, value) => MapEntry(
          key,
          homeDomainByHomeModel(value),
        ),
      ),
      generationVII: versionsModel.generationVII == null
          ? null
          : generationVIIByGenerationVIIModel(versionsModel.generationVII!),
      generationVIIi: versionsModel.generationVIII == null
          ? null
          : generationViiiByGenerationVIIIModel(versionsModel.generationVIII!),
    );
    return versions;
  }

  @override
  Other otherByOtherModel(OtherModel otherModel) {
    final other = Other(
      homeDomain: otherModel.home == null
          ? null
          : homeDomainByHomeModel(otherModel.home!),
      dreamWorld: otherModel.dreamWorld == null
          ? null
          : dreamWorldByDreamWorldModel(otherModel.dreamWorld!),
      officialArtwork: otherModel.officialArtwork == null
          ? null
          : officialArtworkByOfficialArtworkModel(otherModel.officialArtwork!),
      showdown: otherModel.showdown == null
          ? null
          : spritesBySpritesModel(otherModel.showdown!),
    );
    return other;
  }

  @override
  PokemonSpritesDomain spritesBySpritesModel(
      PokemonSpritesModel pokemonSpritesModel) {
    final pokemonspritesdomain = PokemonSpritesDomain(
      backDefault: pokemonSpritesModel.backDefault,
      backFemale: pokemonSpritesModel.backFemale,
      backShiny: pokemonSpritesModel.backShiny,
      backShinyFemale: pokemonSpritesModel.backShinyFemale,
      frontDefault: pokemonSpritesModel.frontDefault,
      frontFemale: pokemonSpritesModel.frontFemale,
      frontShiny: pokemonSpritesModel.frontShiny,
      frontShinyFemale: pokemonSpritesModel.frontShinyFemale,
      other: pokemonSpritesModel.other == null
          ? null
          : otherByOtherModel(pokemonSpritesModel.other!),
      versions: pokemonSpritesModel.versions == null
          ? null
          : versionsByVersionsModel(pokemonSpritesModel.versions!),
      animated: pokemonSpritesModel.animated == null
          ? null
          : spritesBySpritesModel(pokemonSpritesModel.animated!),
    );
    return pokemonspritesdomain;
  }

  @override
  RedBlue redBlueByRedBlueModel(RedBlueModel redBlueModel) {
    final redblue = RedBlue(
      backDefault: redBlueModel.backDefault,
      backGray: redBlueModel.backGray,
      backTransparent: redBlueModel.backTransparent,
      frontDefault: redBlueModel.frontDefault,
      frontGray: redBlueModel.frontGray,
      frontTransparent: redBlueModel.frontTransparent,
    );
    return redblue;
  }

  @override
  Crystal crystalByCrystalModel(CrystalModel crystalModel) {
    final crystal = Crystal(
      backDefault: crystalModel.backDefault,
      backShiny: crystalModel.backShiny,
      backShinyTransparent: crystalModel.backShinyTransparent,
      backTransparent: crystalModel.backTransparent,
      frontDefault: crystalModel.frontDefault,
      frontShiny: crystalModel.frontShiny,
      frontShinyTransparent: crystalModel.frontShinyTransparent,
      frontTransparent: crystalModel.frontTransparent,
    );
    return crystal;
  }

  @override
  Gold goldByGoldModel(GoldModel goldModel) {
    final gold = Gold(
      backDefault: goldModel.backDefault,
      backShiny: goldModel.backShiny,
      frontDefault: goldModel.frontDefault,
      frontShiny: goldModel.frontShiny,
      frontTransparent: goldModel.frontTransparent,
    );
    return gold;
  }

  @override
  Stat statByStatModel(StatModel statModel) {
    final stat = Stat(
      baseStat: statModel.baseStat,
      effort: statModel.effort,
      stat: statModel.stat,
    );
    return stat;
  }

  @override
  Type typeByTypeModel(TypeModel typeModel) {
    final type = Type(
      slot: typeModel.slot,
      type: typeModel.type,
    );
    return type;
  }

  @override
  GenerationI generationIByGenerationIModel(GenerationIModel generationIModel) {
    final generationi = GenerationI(
      redBlue: generationIModel.redBlue == null
          ? null
          : redBlueByRedBlueModel(generationIModel.redBlue!),
      yellow: generationIModel.yellow == null
          ? null
          : redBlueByRedBlueModel(generationIModel.yellow!),
    );
    return generationi;
  }

  @override
  GenerationII generationIIByGenerationIIModel(
      GenerationIIModel generationIIModel) {
    final generationii = GenerationII(
      crystal: generationIIModel.crystal == null
          ? null
          : crystalByCrystalModel(generationIIModel.crystal!),
      gold: generationIIModel.gold == null
          ? null
          : goldByGoldModel(generationIIModel.gold!),
      silver: generationIIModel.silver == null
          ? null
          : goldByGoldModel(generationIIModel.silver!),
    );
    return generationii;
  }

  @override
  GenerationIII generationIIIByGenerationIIIIModel(
      GenerationIIIModel generationIIIIModel) {
    final generationiii = GenerationIII(
      emerald: generationIIIIModel.emerald == null
          ? null
          : officialArtworkByOfficialArtworkModel(generationIIIIModel.emerald!),
      fireredLeafgreen: generationIIIIModel.fireredLeafgreen == null
          ? null
          : goldByGoldModel(generationIIIIModel.fireredLeafgreen!),
      rubySapphire: generationIIIIModel.rubySapphire == null
          ? null
          : goldByGoldModel(generationIIIIModel.rubySapphire!),
    );
    return generationiii;
  }

  @override
  GenerationIV generationIvByGenerationIVModel(
      GenerationIVModel generationIvModel) {
    final generationiv = GenerationIV(
      diamondPearl: generationIvModel.diamondPearl == null
          ? null
          : spritesBySpritesModel(generationIvModel.diamondPearl!),
      heartgoldSoulsilver: generationIvModel.heartgoldSoulsilver == null
          ? null
          : spritesBySpritesModel(generationIvModel.heartgoldSoulsilver!),
      platinum: generationIvModel.platinum == null
          ? null
          : spritesBySpritesModel(generationIvModel.platinum!),
    );
    return generationiv;
  }

  @override
  GenerationV generationVByGenerationVModel(GenerationVModel generationVModel) {
    final generationv = GenerationV(
        blackWhite: generationVModel.blackWhite == null
            ? null
            : spritesBySpritesModel(generationVModel.blackWhite!));
    return generationv;
  }

  @override
  GenerationVII generationVIIByGenerationVIIModel(
      GenerationVIIModel generationViiModel) {
    final generationvii = GenerationVII(
      icons: generationViiModel.icons == null
          ? null
          : dreamWorldByDreamWorldModel(generationViiModel.icons!),
      ultraSunUltraMoon: generationViiModel.ultraSunUltraMoon == null
          ? null
          : homeDomainByHomeModel(generationViiModel.ultraSunUltraMoon!),
    );
    return generationvii;
  }

  @override
  GenerationVIII generationViiiByGenerationVIIIModel(
      GenerationVIIIModel generationVIIIModel) {
    final generationviii = GenerationVIII(
        icons: generationVIIIModel.icons == null
            ? null
            : dreamWorldByDreamWorldModel(generationVIIIModel.icons!));
    return generationviii;
  }

  @override
  PokemonNameAndUrlDomain pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
      PokemonNameAndUrlModel pokemonNameAndUrlModel) {
    final pokemonnameandurldomain = PokemonNameAndUrlDomain(
      name: pokemonNameAndUrlModel.name,
      url: pokemonNameAndUrlModel.url,
    );
    return pokemonnameandurldomain;
  }

  @override
  PokemonNameWithLanguageDomain
      pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(
          PokemonNameWithLanguageModel pokemonNameWithLanguageModel) {
    final pokemonnamewithlanguagedomain = PokemonNameWithLanguageDomain(
      language: pokemonNameWithLanguageModel.language == null
          ? null
          : pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
              pokemonNameWithLanguageModel.language!),
      name: pokemonNameWithLanguageModel.name,
    );
    return pokemonnamewithlanguagedomain;
  }
}
