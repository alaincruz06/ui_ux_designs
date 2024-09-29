import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_and_url_model.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/models/pokemon_name_with_lang_model.dart';

class PokemonFormModel {
  PokemonFormModel({
    required this.formName,
    required this.formNames,
    required this.formOrder,
    required this.id,
    required this.isBattleOnly,
    required this.isDefault,
    required this.isMega,
    required this.name,
    required this.names,
    required this.order,
    required this.pokemon,
    required this.sprites,
    required this.types,
    required this.versionGroup,
  });

  final String? formName;
  final List<PokemonNameWithLanguageModel> formNames;
  final int? formOrder;
  final int? id;
  final bool? isBattleOnly;
  final bool? isDefault;
  final bool? isMega;
  final String? name;
  final List<PokemonNameWithLanguageModel> names;
  final int? order;
  final PokemonNameAndUrlModel? pokemon;
  final PokemonSpritesModel? sprites;
  final List<FormTypeModel> types;
  final PokemonNameAndUrlModel? versionGroup;

  factory PokemonFormModel.fromJson(Map<String, dynamic> json) {
    return PokemonFormModel(
      formName: json["form_name"],
      formNames: json["form_names"] == null
          ? []
          : List<PokemonNameWithLanguageModel>.from(json["form_names"]!
              .map((x) => PokemonNameWithLanguageModel.fromJson(x))),
      formOrder: json["form_order"],
      id: json["id"],
      isBattleOnly: json["is_battle_only"],
      isDefault: json["is_default"],
      isMega: json["is_mega"],
      name: json["name"],
      names: json["names"] == null
          ? []
          : List<PokemonNameWithLanguageModel>.from(json["names"]!
              .map((x) => PokemonNameWithLanguageModel.fromJson(x))),
      order: json["order"],
      pokemon: json["pokemon"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["pokemon"]),
      sprites: json["sprites"] == null
          ? null
          : PokemonSpritesModel.fromJson(json["sprites"]),
      types: json["types"] == null
          ? []
          : List<FormTypeModel>.from(
              json["types"]!.map((x) => FormTypeModel.fromJson(x))),
      versionGroup: json["version_group"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["version_group"]),
    );
  }

  @override
  String toString() {
    return "$formName, $formNames, $formOrder, $id, $isBattleOnly, $isDefault, $isMega, $name, $names, $order, $pokemon, $sprites, $types, $versionGroup, ";
  }
}

class FormTypeModel {
  FormTypeModel({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final PokemonNameAndUrlModel? type;

  factory FormTypeModel.fromJson(Map<String, dynamic> json) {
    return FormTypeModel(
      slot: json["slot"],
      type: json["type"] == null
          ? null
          : PokemonNameAndUrlModel.fromJson(json["type"]),
    );
  }

  @override
  String toString() {
    return "$slot, $type, ";
  }
}
