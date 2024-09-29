import 'package:flutter/material.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/widgets/shimmer_pokemon_list_tile.dart';

class LoadingPokemonListShimmerWidget extends StatelessWidget {
  const LoadingPokemonListShimmerWidget({
    super.key,
    required this.amountOfPokemons,
  });

  final int amountOfPokemons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: amountOfPokemons,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 0.5,
          mainAxisSpacing: 0.5,
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) => const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: ShimmerPokemonListTile(),
        ),
      ),
    );
  }
}
