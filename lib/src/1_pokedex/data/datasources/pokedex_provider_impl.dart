import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_ability_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_form_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_item_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_list_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';
import 'package:ui_ux_designs/src/common/utils/dio_client.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/provider_generic_exception.dart';

abstract class PokedexProvider {
  Future<PokemonListModel?> getPokemonsList({
    required int offset,
    required int limit,
  });

  Future<List<PokemonNameAndUrlModel>> searchPokemons({
    required String name,
  });

  Future<PokemonModel?> getPokemonDetails({
    required String pokemonId,
  });

  Future<PokemonFormModel?> getPokemonForms({
    required String pokemonFormId,
  });

  Future<PokemonItemModel?> getPokemonItem({
    required String pokemonItemId,
  });

  Future<PokemonAbilityModel?> getPokemonAbility({
    required String pokemonAbilityId,
  });
}

class PokedexProviderImpl extends PokedexProvider {
  PokedexProviderImpl({
    required this.logger,
    required this.client,
  });

  final DioHttpClient client;
  final Logger logger;

  final String _pokedexEndpointUrl = 'https://pokeapi.co/api/v2/';

  @override
  Future<PokemonListModel?> getPokemonsList({
    required int offset,
    required int limit,
  }) async {
    try {
      final response = await client.dio.get(
        '$_pokedexEndpointUrl/pokemon/?offset=$offset&limit=$limit',
      );
      if (response.data != null) {
        final PokemonListModel pokemonListResponse =
            PokemonListModel.fromJson(response.data);

        return pokemonListResponse;
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Dio Exception on getPokemonsList: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<List<PokemonNameAndUrlModel>> searchPokemons({
    required String name,
  }) async {
    try {
      //From Implementing search #474 Issue on PokeAPI
      //https://github.com/PokeAPI/pokeapi/issues/474#issuecomment-2328808259
      final response = await client.dio.get(
        'https://pokemon-service-ucql.onrender.com/api/v1/pokemon/search?name=$name',
      );
      if (response.data != null) {
        final List<PokemonNameAndUrlModel> pokemonListResponse =
            List<PokemonNameAndUrlModel>.from(
          response.data!.map(
            (x) => PokemonNameAndUrlModel.fromJson(x),
          ),
        );

        return pokemonListResponse;
      } else {
        return [];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        logger.d(e.response?.data);
        return [];
      } else {
        logger.e('Dio Exception on searchPokemons: $e');
        throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
      }
    }
  }

  @override
  Future<PokemonModel?> getPokemonDetails({
    required String pokemonId,
  }) async {
    try {
      final response = await client.dio.get(
        '$_pokedexEndpointUrl/pokemon/$pokemonId',
      );
      if (response.data != null) {
        return PokemonModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Dio Exception on getPokemonDetails: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<PokemonFormModel?> getPokemonForms({
    required String pokemonFormId,
  }) async {
    try {
      final response = await client.dio.get(
        '$_pokedexEndpointUrl/pokemon-form/$pokemonFormId/',
      );
      if (response.data != null) {
        return PokemonFormModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Dio Exception on getPokemonForms: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<PokemonItemModel?> getPokemonItem({
    required String pokemonItemId,
  }) async {
    try {
      final response = await client.dio.get(
        '$_pokedexEndpointUrl/item/$pokemonItemId/',
      );
      if (response.data != null) {
        return PokemonItemModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Dio Exception on getPokemonItem: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<PokemonAbilityModel?> getPokemonAbility({
    required String pokemonAbilityId,
  }) async {
    try {
      final response = await client.dio.get(
        '$_pokedexEndpointUrl/ability/$pokemonAbilityId/',
      );
      if (response.data != null) {
        return PokemonAbilityModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      logger.e('Dio Exception on getPokemonAbility: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }
}
