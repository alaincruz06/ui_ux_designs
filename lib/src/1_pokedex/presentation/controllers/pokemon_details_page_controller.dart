import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_ability_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_form_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_item_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:ui_ux_designs/src/common/utils/language_controller.dart';

class PokemonDetailsPageController extends GetxController {
  PokemonDetailsPageController({
    required this.pokedexRepository,
    required this.logger,
  });

  final PokedexRepository pokedexRepository;
  final Logger logger;
  final LanguageController languageController = Get.find<LanguageController>();
  PokemonDomain? pokemonDomain;
  List<Color>? colors;
  //onInit + onClose

  @override
  Future<void> onInit() async {
    pokemonDomain = Get.arguments['pokemon'] as PokemonDomain;
    colors = Get.arguments['colors'] as List<Color>;
    super.onInit();
  }

  //Functions

  Future<void> playCry() async {
    final player = AudioPlayer();
    if (pokemonDomain!.cries!.latest != null) {
      await player.play(
        UrlSource(pokemonDomain!.cries!.latest!),
        mode: PlayerMode.lowLatency,
      );
    } else {
      await player.play(
        UrlSource(pokemonDomain!.cries!.legacy!),
        mode: PlayerMode.lowLatency,
      );
    }
  }

  Future<PokemonFormDomain?> getPokemonForm({
    required String pokemonFormId,
  }) async {
    try {
      var pokemonFormDomain = await pokedexRepository.getPokemonForms(
        pokemonFormId: pokemonFormId,
      );
      if (pokemonFormDomain != null) {
        return pokemonFormDomain;
      } else {
        return null;
      }
    } catch (error) {
      logger.e('Error at getPokemonForm: $error');
      return null;
    }
  }

  Future<PokemonItemDomain?> getPokemonItem({
    required String pokemonItemId,
  }) async {
    try {
      var pokemonItemDomain = await pokedexRepository.getPokemonItem(
        pokemonItemId: pokemonItemId,
      );
      if (pokemonItemDomain != null) {
        return pokemonItemDomain;
      } else {
        return null;
      }
    } catch (error) {
      logger.e('Error at getPokemonItem: $error');
      return null;
    }
  }

  Future<PokemonAbilityDomain?> getPokemonAbility({
    required String pokemonAbilityId,
  }) async {
    try {
      var pokemonAbilityDomain = await pokedexRepository.getPokemonAbility(
        pokemonAbilityId: pokemonAbilityId,
      );
      if (pokemonAbilityDomain != null) {
        return pokemonAbilityDomain;
      } else {
        return null;
      }
    } catch (error) {
      logger.e('Error at getPokemonAbility: $error');
      return null;
    }
  }
}
