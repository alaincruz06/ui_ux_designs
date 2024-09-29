import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/core/pokemon_utils.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_list_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_ux_designs/src/common/app/routes/app_pages.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/loading_overlay.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';
import 'package:ui_ux_designs/src/common/utils/snackbar_message_helper.dart';

class PokedexHomePageController extends GetxController {
  PokedexHomePageController({
    required this.pokedexRepository,
    required this.logger,
  });

  final PokedexRepository pokedexRepository;
  final Logger logger;

  //Pagination + pull to refresh
  PagingController<int, PokemonNameAndUrlDomain> pagingController =
      PagingController(
    firstPageKey: 0,
  );
  List<PokemonNameAndUrlDomain> get pokemonList =>
      pagingController.itemList ?? [];
  int _currentPage = 0;
  int _pokemonCount = 0;
  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );
  bool _isNextPageLoading = false;

  final TextEditingController searchController = TextEditingController();

  //onInit + onClose

  @override
  Future<void> onInit() async {
    pagingController.addPageRequestListener(_fetchPage);

    scrollController.addListener(_pagination);
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  //Functions

  /// Load all the Pokemon List.
  Future<void> _fetchPage(int pageKey) async {
    try {
      if (pageKey == 0) {
        pagingController = PagingController(firstPageKey: 0);
      }

      //Getting the amount of Pokemons
      final PokemonListDomain? pokemonListDomain =
          await pokedexRepository.getPokemonsList(
        offset: pageKey,
        limit: limitQueries,
      );

      _pokemonCount = pokemonListDomain?.count ?? 0;

      if (pageKey == _pokemonCount) {
        pagingController.appendLastPage([]);
      } else {
        //Haciendo una copia temporal de los pokemons que no estan presentes en la lista
        //para solo añadir esos y evitar duplicados, con un Set se quedaban duplicados
        var nonExistentPokemons = <PokemonNameAndUrlDomain>[];
        if (pokemonListDomain != null) {
          for (var pokemonRes in pokemonListDomain.results) {
            if (!pokemonList.any(
              (element) => element.name == pokemonRes.name,
            )) {
              nonExistentPokemons.add(pokemonRes);
            }
          }

          if ((pokemonList.length + nonExistentPokemons.length) ==
              _pokemonCount) {
            pagingController.appendLastPage(nonExistentPokemons);
          } else {
            final nextPageKey = pageKey + nonExistentPokemons.length;
            _currentPage = nextPageKey;
            pagingController.appendPage(nonExistentPokemons, nextPageKey);
          }
        }
      }
      update();
    } catch (e) {
      showSnackBarMessage(
        'app.unknownConnectionErrorFromApi'.tr,
        Get.context!,
      );
      pagingController.error = e;
      update();
    }
  }

  Future<void> refreshResults() async {
    if (searchController.text.isNotEmpty) {
      await searchPokemons();
    } else {
      _fetchPage(0);
    }
  }

  Future<void> _pagination() async {
    if (pokemonList.length == _pokemonCount) {
      return;
    }
    if ((scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500) &&
        !_isNextPageLoading) {
      _isNextPageLoading = true;
      await _fetchPage(_currentPage)
          .whenComplete(() => _isNextPageLoading = false);
    }
  }

  Future<void> getToPokemonDetails(
    PokemonDomain pokemon,
    List<Color> colors,
  ) async {
    if (pokemon.cries != null) {
      final player = AudioPlayer();
      if (pokemon.cries!.latest != null) {
        await player.play(
          UrlSource(pokemon.cries!.latest!),
          mode: PlayerMode.lowLatency,
        );
        await _doNavigate(pokemon, colors);
      } else {
        await player.play(
          UrlSource(pokemon.cries!.legacy!),
          mode: PlayerMode.lowLatency,
        );
        await _doNavigate(pokemon, colors);
      }
    }
  }

  Future<void> _doNavigate(PokemonDomain pokemon, List<Color> colors) async {
    await Get.toNamed(
      Routes.pokemonDetails,
      arguments: {
        'pokemon': pokemon,
        'colors': colors,
      },
    );
  }

  Future<void> searchPokemons() async {
    try {
      LoadingOverlay.show();
      final items = await pokedexRepository.searchPokemons(
        name: searchController.text.toLowerCase().trim(),
      );
      pokemonList.assignAll(items);
      LoadingOverlay.hide();
      update();
    } catch (error) {
      LoadingOverlay.hide();
      logger.e('Error at searchPokemons: $error');
    }
  }

  Future<void> clearFilter() async {
    await _fetchPage(0);
    searchController.clear();
  }

  Future<(List<Color>, PokemonDomain)?> getPokemonDetails({
    required String name,
  }) async {
    try {
      var pokemonDomain = await pokedexRepository.getPokemonDetails(
        pokemonId: name,
      );
      if (pokemonDomain != null) {
        if (pokemonDomain.sprites != null &&
            pokemonDomain.sprites!.frontDefault != null) {
          List<Color> colors =
              await getColorsFromSprite(pokemonDomain.sprites!.frontDefault!);
          return (colors, pokemonDomain);
        }
      } else {
        return null;
      }
    } catch (error) {
      logger.e('Error at getPokemonDetails: $error');
      return null;
    }
    return null;
  }

  Future<List<Color>> getColorsFromSprite(String spriteUrl) async {
    try {
      List<Color> colors =
          await PokemonUtils().extractColorsFromImageUrl(spriteUrl);
      if (colors.isNotEmpty) {
        return colors;
      } else {
        return [];
      }
    } catch (error) {
      logger.e('Error at getColorFromSprite: $error');
      return [];
    }
  }
}
