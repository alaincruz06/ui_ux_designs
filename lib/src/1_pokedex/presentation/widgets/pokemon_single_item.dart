import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux_designs/common/app/constants/assets.dart';
import 'package:ui_ux_designs/src/1_pokedex/core/pokemon_utils.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/images/cache_network_image_widget_with_shimmer.dart';
import 'package:ui_ux_designs/src/common/utils/aux_functions.dart';

class PokemonSingleItem extends StatelessWidget {
  const PokemonSingleItem({
    super.key,
    required this.colors,
    required this.pokemon,
    required this.onTap,
  });

  final List<Color> colors;
  final PokemonDomain pokemon;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await onTap(),
      child: Container(
        width: 0.15.sh,
        height: 0.15.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: colors.first,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -30,
              right: -30,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SvgPicture.asset(
                    Assets.assetsSvgsPokeball,
                    colorFilter: ColorFilter.mode(
                      colors[1],
                      BlendMode.srcIn,
                    ),
                    width: 0.16.sh,
                    height: 0.16.sh,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name != null
                        ? pokemon.name!.replaceFirst(
                            pokemon.name!.substring(0, 1),
                            pokemon.name!.substring(0, 1).toUpperCase())
                        : '',
                    overflow: TextOverflow.ellipsis,
                    style: textStyleBodyBold.copyWith(
                      color: colors[1],
                    ),
                  ),
                  ...pokemon.types.map(
                    (pokeType) => Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AuxFunctions.hexToColor(
                            PokemonUtils.pokemonTypeColours[
                                pokeType.type!.name ?? 'unknown']!,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Text(
                          pokeType.type!.name ?? '',
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '#${pokemon.id.toString()}',
                      style: textStyleBody.copyWith(
                        color: colors[1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: CacheNetworkImageWidgetWithShimmer(
                urlImage: pokemon.sprites?.frontDefault ?? '',
                baseColor: AppColors.grey150,
                highlightColor: AppColors.grey400,
                containerHeight: 0.2.sh,
                containerWidth: 0.2.sh,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
