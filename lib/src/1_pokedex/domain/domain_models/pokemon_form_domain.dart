import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_with_lang_domain.dart';

class PokemonFormDomain {
  PokemonFormDomain({
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
  final List<PokemonNameWithLanguageDomain> formNames;
  final int? formOrder;
  final int? id;
  final bool? isBattleOnly;
  final bool? isDefault;
  final bool? isMega;
  final String? name;
  final List<PokemonNameWithLanguageDomain> names;
  final int? order;
  final PokemonNameAndUrlDomain? pokemon;
  final PokemonSpritesDomain? sprites;
  final List<FormTypeDomain> types;
  final PokemonNameAndUrlDomain? versionGroup;

  @override
  String toString() {
    return "$formName, $formNames, $formOrder, $id, $isBattleOnly, $isDefault, $isMega, $name, $names, $order, $pokemon, $sprites, $types, $versionGroup, ";
  }
}

class FormTypeDomain {
  FormTypeDomain({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final PokemonNameAndUrlDomain? type;

  @override
  String toString() {
    return "$slot, $type, ";
  }
}
