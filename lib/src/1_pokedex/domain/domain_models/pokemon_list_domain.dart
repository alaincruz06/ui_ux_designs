import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';

class PokemonListDomain {
  PokemonListDomain({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonNameAndUrlDomain> results;
}
