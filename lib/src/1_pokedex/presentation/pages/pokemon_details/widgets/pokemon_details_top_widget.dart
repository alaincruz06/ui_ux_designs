import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokemon_details_page_controller.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/images/cache_network_image_widget_with_shimmer.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class PokemonDetailsTopWidget extends GetView<PokemonDetailsPageController> {
  const PokemonDetailsTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //Bakground color
        Container(
          margin: EdgeInsets.only(
            bottom: 0.05.sh,
          ),
          decoration: BoxDecoration(
            color: controller.colors!.first,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.elliptical(160, 30),
              bottomRight: Radius.elliptical(160, 30),
            ),
          ),
        ),
        //Pokemon image
        Positioned(
          bottom: -25,
          child: SizedBox(
            height: 0.24.sh,
            width: 0.24.sh,
            child: CacheNetworkImageWidgetWithShimmer(
              urlImage: controller.pokemonDomain!.sprites?.frontDefault ?? '',
              baseColor: AppColors.grey150,
              highlightColor: AppColors.grey400,
              containerHeight: 0.24.sh,
              containerWidth: 0.24.sh,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 10,
          child: Text(
            controller.pokemonDomain!.name != null
                ? controller.pokemonDomain!.name!.replaceFirst(
                    controller.pokemonDomain!.name!.substring(0, 1),
                    controller.pokemonDomain!.name!
                        .substring(0, 1)
                        .toUpperCase(),
                  )
                : '',
            overflow: TextOverflow.ellipsis,
            style: textStyleTitle1Bold.copyWith(
              color: controller.colors![1],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 10,
          child: Column(
            children: [
              Text(
                '#${controller.pokemonDomain!.id.toString()}',
                overflow: TextOverflow.ellipsis,
                style: textStyleTitle1Bold.copyWith(
                  color: controller.colors![1],
                ),
              ),
              controller.pokemonDomain!.cries != null
                  ? IconButton(
                      onPressed: () => controller.playCry(),
                      icon: Icon(
                        color: controller.colors![1],
                        Icons.record_voice_over_outlined,
                        size: kiconSize * 1.2,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
