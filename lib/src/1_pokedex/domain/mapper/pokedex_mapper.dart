import 'package:smartstruct/smartstruct.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_ability_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_form_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_item_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_list_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_with_lang_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_ability_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_form_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_item_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_list_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_with_lang_domain.dart';

part 'pokedex_mapper.mapper.g.dart';

@Mapper()
abstract class PokedexMapper {
  //PokemonAbilityModel
  PokemonAbilityDomain pokemonAbilityDomainByPokemonAbilityModel(
    PokemonAbilityModel pokemonAbilityModel,
  );

  EffectChangeDomain effectChangeDomainByEffectChangeModel(
    EffectChangeModel effectChangeModel,
  );

  FlavorTextEntryDomain flavorTextEntryDomainByFlavorTextEntryModel(
    FlavorTextEntryModel flavorTextEntryModel,
  );

  PokemonWithAbilityDomain pokemonWithAbilityDomainByPokemonWithAbilityModel(
    PokemonWithAbilityModel pokemonWithAbilityModel,
  );

  //PokemonFormModel
  PokemonFormDomain pokemonFormDomainByPokemonFormModel(
      PokemonFormModel pokemonFormModel);

  FormTypeDomain formTypeDomainByFormTypeModel(
    FormTypeModel formTypeModel,
  );

  //PokemonItemModel
  PokemonItemDomain pokemonItemDomainByPokemonItemModel(
    PokemonItemModel pokemonItemModel,
  );

  EffectEntryDomain effectEntryDomainByEffectEntryModel(
    EffectEntryModel effectEntryModel,
  );

  GameIndexGenerationDomain gameIndexGenerationDomainByGameIndexGenerationModel(
      GameIndexGenerationModel gameIndexGenerationModel);

  HeldByPokemonDomain heldByPokemonDomainByHeldByPokemonModel(
      HeldByPokemonModel heldByPokemonModel);

  SpritesOnlyDefaultDomain spritesOnlyDefaultDomainBySpritesOnlyDefaultModel(
      SpritesOnlyDefaultModel spritesOnlyDefaultModel);

  //PokemonListModel
  PokemonListDomain pokemonListDomainByPokemonListModel(
      PokemonListModel pokemonListModel);

  //PokemonModel
  PokemonDomain pokemonDomainByPokemonModel(PokemonModel pokemonModel);

  VersionDetailDomain versionDetailDomainByVersionDetailModel(
      VersionDetailModel versionDetailModel);

  PokemonAbilityWithNameUrlDomain abilityByAbilityModel(
      PokemonAbilityWithNameUrlModel abilityModel);

  Cries criesByCriesModel(CriesModel criesModel);

  GameIndex gameIndexByGameIndexModel(
      GameIndexVersionModel gameIndexVersionModel);

  HeldItem heldItemByHeldItemModel(HeldItemModel heldItemModel);

  VersionDetail versionDetailByVersionDetailModel(
      VersionDetailModel versionDetailModel);

  HomeDomain homeDomainByHomeModel(HomeModel moveModel);

  DreamWorld dreamWorldByDreamWorldModel(DreamWorldModel dreamWorldModel);

  OfficialArtwork officialArtworkByOfficialArtworkModel(
      OfficialArtworkModel officialArtworkModel);

  Move moveByMoveModel(MoveModel moveModel);

  VersionGroupDetail versionGroupDetailByVersionGroupDetailModel(
      VersionGroupDetailModel versionGroupDetailModel);

  Versions versionsByVersionsModel(VersionsModel versionsModel);

  Other otherByOtherModel(OtherModel otherModel);

  PokemonSpritesDomain spritesBySpritesModel(
      PokemonSpritesModel pokemonSpritesModel);

  RedBlue redBlueByRedBlueModel(RedBlueModel redBlueModel);

  Crystal crystalByCrystalModel(CrystalModel crystalModel);

  Gold goldByGoldModel(GoldModel goldModel);

  Stat statByStatModel(StatModel statModel);

  Type typeByTypeModel(TypeModel typeModel);

  GenerationI generationIByGenerationIModel(GenerationIModel generationIModel);

  GenerationII generationIIByGenerationIIModel(
      GenerationIIModel generationIIModel);

  GenerationIII generationIIIByGenerationIIIIModel(
      GenerationIIIModel generationIIIIModel);

  GenerationIV generationIvByGenerationIVModel(
      GenerationIVModel generationIvModel);

  GenerationV generationVByGenerationVModel(GenerationVModel generationVModel);

  GenerationVII generationVIIByGenerationVIIModel(
      GenerationVIIModel generationViiModel);

  GenerationVIII generationViiiByGenerationVIIIModel(
      GenerationVIIIModel generationVIIIModel);

  //PokemonNameAndUrlModel
  PokemonNameAndUrlDomain pokemonNameAndUrlDomainByPokemonNameAndUrlModel(
    PokemonNameAndUrlModel pokemonNameAndUrlModel,
  );

  //PokemonNameWithLanguageModel
  PokemonNameWithLanguageDomain
      pokemonNameWithLanguageDomainByPokemonNameWithLanguageModel(
    PokemonNameWithLanguageModel pokemonNameWithLanguageModel,
  );
}
