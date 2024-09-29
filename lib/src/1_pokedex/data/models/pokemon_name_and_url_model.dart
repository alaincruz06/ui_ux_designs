class PokemonNameAndUrlModel {
  PokemonNameAndUrlModel({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory PokemonNameAndUrlModel.fromJson(Map<String, dynamic> json) {
    return PokemonNameAndUrlModel(
      name: json["name"],
      url: json["url"],
    );
  }
}
