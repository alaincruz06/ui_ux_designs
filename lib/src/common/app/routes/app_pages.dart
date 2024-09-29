import 'package:get/get.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/bindings/pokedex_home_page_binding.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/bindings/pokemon_details_page_binding.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/pages/pokedex_pages_export.dart';
import 'package:ui_ux_designs/src/common/presentation/bindings/home_page_binding.dart';
import 'package:ui_ux_designs/src/common/presentation/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.pokedexHome,
      page: () => const PokedexHomePage(),
      binding: PokedexHomePageBinding(),
    ),
    GetPage(
      name: Routes.pokemonDetails,
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsPageBinding(),
    ),
  ];
}
