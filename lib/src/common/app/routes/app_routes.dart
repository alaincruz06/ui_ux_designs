part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  static const pokedexHome = _Paths.pokedexHome;
  static const pokemonDetails = _Paths.pokemonDetails;
}

abstract class _Paths {
  static const home = '/home';
  static const pokedexHome = '/pokedex-home';
  static const pokemonDetails = '/pokemon-details';
}
