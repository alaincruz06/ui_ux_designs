import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';

class PokemonListModel {
  PokemonListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonNameAndUrlModel> results;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? []
          : List<PokemonNameAndUrlModel>.from(
              json["results"]!.map(
                (x) => PokemonNameAndUrlModel.fromJson(x),
              ),
            ),
    );
  }
}
