import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/datasources/pokedex_provider_impl.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_ability_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_form_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_item_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_list_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/mapper/pokedex_mapper.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/custom_exception.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/provider_generic_exception.dart';

abstract class PokedexRepository {
  Future<PokemonListDomain?> getPokemonsList({
    required int offset,
    required int limit,
  });

  Future<List<PokemonNameAndUrlDomain>> searchPokemons({
    required String name,
  });

  Future<PokemonDomain?> getPokemonDetails({
    required String pokemonId,
  });

  Future<PokemonFormDomain?> getPokemonForms({
    required String pokemonFormId,
  });

  Future<PokemonItemDomain?> getPokemonItem({
    required String pokemonItemId,
  });

  Future<PokemonAbilityDomain?> getPokemonAbility({
    required String pokemonAbilityId,
  });
}

class PokedexRepositoryImpl extends PokedexRepository {
  PokedexRepositoryImpl({
    required this.logger,
    required this.pokedexProvider,
    required this.pokedexMapper,
  });

  final Logger logger;
  final PokedexProvider pokedexProvider;
  final PokedexMapper pokedexMapper;

  @override
  Future<PokemonListDomain?> getPokemonsList({
    required int offset,
    required int limit,
  }) async {
    try {
      var pokemonModelList = await pokedexProvider.getPokemonsList(
        offset: offset,
        limit: limit,
      );
      if (pokemonModelList != null) {
        return pokedexMapper.pokemonListDomainByPokemonListModel(
          pokemonModelList,
        );
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<List<PokemonNameAndUrlDomain>> searchPokemons({
    required String name,
  }) async {
    try {
      var pokemonModelList = await pokedexProvider.searchPokemons(
        name: name,
      );
      if (pokemonModelList.isNotEmpty) {
        return pokemonModelList
            .map((resultModel) => pokedexMapper
                .pokemonNameAndUrlDomainByPokemonNameAndUrlModel(resultModel))
            .toList();
      } else {
        return [];
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<PokemonDomain?> getPokemonDetails({
    required String pokemonId,
  }) async {
    try {
      var pokemonModel = await pokedexProvider.getPokemonDetails(
        pokemonId: pokemonId,
      );
      if (pokemonModel != null) {
        return pokedexMapper.pokemonDomainByPokemonModel(pokemonModel);
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<PokemonFormDomain?> getPokemonForms({
    required String pokemonFormId,
  }) async {
    try {
      var pokemonFormModel = await pokedexProvider.getPokemonForms(
        pokemonFormId: pokemonFormId,
      );
      if (pokemonFormModel != null) {
        return pokedexMapper
            .pokemonFormDomainByPokemonFormModel(pokemonFormModel);
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<PokemonItemDomain?> getPokemonItem({
    required String pokemonItemId,
  }) async {
    try {
      var pokemonItemModel = await pokedexProvider.getPokemonItem(
        pokemonItemId: pokemonItemId,
      );
      if (pokemonItemModel != null) {
        return pokedexMapper
            .pokemonItemDomainByPokemonItemModel(pokemonItemModel);
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<PokemonAbilityDomain?> getPokemonAbility({
    required String pokemonAbilityId,
  }) async {
    try {
      var pokemonAbilityModel = await pokedexProvider.getPokemonAbility(
        pokemonAbilityId: pokemonAbilityId,
      );
      if (pokemonAbilityModel != null) {
        return pokedexMapper
            .pokemonAbilityDomainByPokemonAbilityModel(pokemonAbilityModel);
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }
}
