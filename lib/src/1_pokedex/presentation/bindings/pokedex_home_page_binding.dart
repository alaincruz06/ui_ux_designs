import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokedex_home_page_controller.dart';

class PokedexHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PokedexHomePageController(
        pokedexRepository: Get.find<PokedexRepository>(),
        logger: Get.find<Logger>(),
      ),
      fenix: true,
    );
  }
}
