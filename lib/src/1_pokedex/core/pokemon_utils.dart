import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonUtils {
  static const pokemonTypeColours = {
    'normal': '#A8A77A',
    'fighting': '#C22E28',
    'flying': '#A98FF3',
    'poison': '#A33EA1',
    'ground': '#E2BF65',
    'rock': '#B6A136',
    'bug': '#A6B91A',
    'ghost': '#735797',
    'steel': '#B7B7CE',
    'fire': '#EE8130',
    'water': '#6390F0',
    'grass': '#7AC74C',
    'electric': '#F7D02C',
    'psychic': '#F95587',
    'ice': '#96D9D6',
    'dragon': '#6F35FC',
    'dark': '#705746',
    'fairy': '#D685AD',
    'stellar': '#EC6391',
    'unknown': '#A8D2A2',
  };

  Future<List<Color>> extractColorsFromImageUrl(String imageUrl) async {
    final imageProvider = CachedNetworkImageProvider(imageUrl);
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);

    // Get the top 3 most common colors
    return paletteGenerator.paletteColors
        .map((paletteColor) => paletteColor.color)
        .take(3)
        .toList();
  }

  static String pokemonHeightCalculator(int height) {
    String heightStr = height.toString();
    if (heightStr.length == 1) {
      return '0.$heightStr m';
    } else {
      String wholePart = heightStr.substring(0, heightStr.length - 1);
      String decimalPart = heightStr.substring(heightStr.length - 1);
      return '$wholePart.$decimalPart m';
    }
  }

  static String pokemonWeightCalculator(int weight) {
    String weightStr = weight.toString();
    if (weightStr.length == 1) {
      return '0.$weightStr kg';
    } else {
      String wholePart = weightStr.substring(0, weightStr.length - 1);
      String decimalPart = weightStr.substring(weightStr.length - 1);
      return '$wholePart.$decimalPart kg';
    }
  }
}
