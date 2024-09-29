import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';

class PokemonNameWithLanguageDomain {
  PokemonNameWithLanguageDomain({
    required this.language,
    required this.name,
  });

  final PokemonNameAndUrlDomain? language;
  final String? name;

  @override
  String toString() {
    return "$language, $name, ";
  }
}
