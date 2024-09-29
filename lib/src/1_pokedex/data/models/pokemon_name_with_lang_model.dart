import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';

class PokemonNameWithLanguageModel {
  PokemonNameWithLanguageModel({
    required this.language,
    required this.name,
  });

  final PokemonNameAndUrlModel? language;
  final String? name;

  factory PokemonNameWithLanguageModel.fromJson(Map<String, dynamic> json) {
    return PokemonNameWithLanguageModel(
      language: json["language"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["language"]),
      name: json["name"],
    );
  }

  @override
  String toString() {
    return "$language, $name, ";
  }
}
