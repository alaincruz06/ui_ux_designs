import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokemon_details_page_controller.dart';

class PokemonDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PokemonDetailsPageController(
        logger: Get.find<Logger>(),
        pokedexRepository: Get.find<PokedexRepository>(),
      ),
      fenix: true,
    );
  }
}
