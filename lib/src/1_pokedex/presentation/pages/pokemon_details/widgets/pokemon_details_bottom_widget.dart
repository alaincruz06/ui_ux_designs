import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/1_pokedex/core/pokemon_utils.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_ability_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_form_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_item_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokemon_details_page_controller.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/images/cache_network_image_widget_with_shimmer.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/shimmer_widget.dart';
import 'package:ui_ux_designs/src/common/utils/aux_functions.dart';

class PokemonDetailsBottomWidget extends GetView<PokemonDetailsPageController> {
  const PokemonDetailsBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          20.verticalSpace,
          //Types
          PokemonTypesWidget(
            controller: controller,
          ),
          20.verticalSpace,
          //Experiencia base
          PokemonBaseExperienceWidget(
            controller: controller,
          ),
          20.verticalSpace,
          //Height/Weight
          PokemonHeigthWeightWidget(
            controller: controller,
          ),
          //Height/Weight
          PokemonAbilitiesWidget(
            controller: controller,
          ),
          //Forms
          PokemonFormsWidget(
            controller: controller,
          ),
          //Items
          PokemonHeldItemsWidget(
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class PokemonTypesWidget extends StatelessWidget {
  const PokemonTypesWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.pokemonDomain!.types
          .map(
            (pokeType) => Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AuxFunctions.hexToColor(
                    PokemonUtils
                        .pokemonTypeColours[pokeType.type!.name ?? 'unknown']!,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 3,
                ),
                child: Text(
                  'app.${pokeType.type!.name}'.tr,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class PokemonBaseExperienceWidget extends StatelessWidget {
  const PokemonBaseExperienceWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.03.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${'app.baseExperience'.tr}:',
            style: textStyleBody,
          ),
          Text(
            controller.pokemonDomain!.baseExperience.toString(),
            style: textStyleBody,
          ),
        ],
      ),
    );
  }
}

class PokemonHeigthWeightWidget extends StatelessWidget {
  const PokemonHeigthWeightWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.08.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'app.height'.tr,
                  style: textStyleBody,
                ),
                Text(
                  PokemonUtils.pokemonHeightCalculator(
                      controller.pokemonDomain!.height ?? 0),
                  style: textStyleTitle1Bold,
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: controller.colors![1],
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'app.weight'.tr,
                  style: textStyleBody,
                ),
                Text(
                  PokemonUtils.pokemonWeightCalculator(
                      controller.pokemonDomain!.weight ?? 0),
                  style: textStyleTitle1Bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonAbilitiesWidget extends StatelessWidget {
  const PokemonAbilitiesWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return controller.pokemonDomain!.abilities.isNotEmpty
        ? Column(
            children: [
              20.verticalSpace,
              Text(
                'app.abilities'.tr,
                style: textStyleTitle1Bold,
              ),
              10.verticalSpace,
              ListView.builder(
                itemCount: controller.pokemonDomain!.abilities.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => FutureBuilder(
                  future: controller.getPokemonAbility(
                    pokemonAbilityId: controller
                        .pokemonDomain!.abilities[index].ability!.name!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      PokemonAbilityDomain? pokemonAbility = snapshot.data;
                      if (pokemonAbility != null) {
                        return ListTile(
                          title: Text(
                            '${pokemonAbility.names.firstWhere((name) => name.language!.name == controller.languageController.languageCode.value).name ?? 'en'}:',
                          ),
                          subtitle: Text(pokemonAbility.flavorTextEntries
                                  .firstWhere((name) =>
                                      name.language!.name ==
                                      controller.languageController.languageCode
                                          .value)
                                  .flavorText ??
                              'en'),
                          isThreeLine: true,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: ShimmerWidget(
                          baseColor: AppColors.grey150,
                          highlightColor: AppColors.grey400,
                          isLoading: true,
                          child: Container(
                            width: 0.15.sh,
                            height: 0.05.sh,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.grey150,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          )
        : const SizedBox();
  }
}

class PokemonFormsWidget extends StatelessWidget {
  const PokemonFormsWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return controller.pokemonDomain!.forms.length > 1
        ? Column(
            children: [
              20.verticalSpace,
              Text(
                'app.forms'.tr,
                style: textStyleTitle1Bold,
              ),
              10.verticalSpace,
              SizedBox(
                height: 0.25.sh,
                child: ListView.builder(
                  itemCount: controller.pokemonDomain!.forms.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => FutureBuilder(
                    future: controller.getPokemonForm(
                      pokemonFormId:
                          controller.pokemonDomain!.forms[index].name!,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        PokemonFormDomain? pokemonForm = snapshot.data;
                        if (pokemonForm != null) {
                          return SizedBox(
                            width: 0.15.sh,
                            height: 0.2.sh,
                            child: Column(
                              children: [
                                Text(pokemonForm.formNames
                                        .firstWhere((name) =>
                                            name.language!.name ==
                                            controller.languageController
                                                .languageCode.value)
                                        .name ??
                                    'en'),
                                pokemonForm.sprites != null &&
                                        pokemonForm.sprites!.frontDefault !=
                                            null
                                    ? CacheNetworkImageWidgetWithShimmer(
                                        urlImage: controller.pokemonDomain!
                                                .sprites?.frontDefault ??
                                            '',
                                        baseColor: AppColors.grey150,
                                        highlightColor: AppColors.grey400,
                                        containerHeight: 0.28.sh,
                                        containerWidth: 0.28.sh,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: pokemonForm.types
                                      .map(
                                        (pokeType) => Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: AuxFunctions.hexToColor(
                                                PokemonUtils.pokemonTypeColours[
                                                    pokeType.type!.name ??
                                                        'unknown']!,
                                              ),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 10,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 3,
                                            ),
                                            child: Text(
                                              'app.${pokeType.type!.name}'.tr,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ShimmerWidget(
                            baseColor: AppColors.grey150,
                            highlightColor: AppColors.grey400,
                            isLoading: true,
                            child: Container(
                              width: 0.15.sh,
                              height: 0.05.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: AppColors.grey150,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          )
        : const SizedBox();
  }
}

class PokemonHeldItemsWidget extends StatelessWidget {
  const PokemonHeldItemsWidget({
    super.key,
    required this.controller,
  });

  final PokemonDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return controller.pokemonDomain!.heldItems.isNotEmpty
        ? Column(
            children: [
              20.verticalSpace,
              Text(
                'app.heldItems'.tr,
                style: textStyleTitle1Bold,
              ),
              10.verticalSpace,
              ListView.builder(
                itemCount: controller.pokemonDomain!.heldItems.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) => FutureBuilder(
                  future: controller.getPokemonItem(
                    pokemonItemId:
                        controller.pokemonDomain!.heldItems[index].item!.name!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      PokemonItemDomain? pokemonItem = snapshot.data;
                      if (pokemonItem != null) {
                        return ListTile(
                          leading: pokemonItem.sprites != null &&
                                  pokemonItem.sprites!.spritesDefault != null
                              ? CacheNetworkImageWidgetWithShimmer(
                                  urlImage:
                                      pokemonItem.sprites!.spritesDefault ?? '',
                                  baseColor: AppColors.grey150,
                                  highlightColor: AppColors.grey400,
                                  containerHeight: 0.05.sw,
                                  containerWidth: 0.05.sw,
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox(),
                          title: Text(
                            '${pokemonItem.names.firstWhere((name) => name.language!.name == controller.languageController.languageCode.value).name ?? 'en'}:',
                          ),
                          subtitle: Text(
                            pokemonItem.flavorTextEntries
                                    .firstWhere((name) =>
                                        name.language!.name ==
                                        controller.languageController
                                            .languageCode.value)
                                    .flavorText ??
                                'en',
                          ),
                          isThreeLine: true,
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ShimmerWidget(
                          baseColor: AppColors.grey150,
                          highlightColor: AppColors.grey400,
                          isLoading: true,
                          child: Container(
                            width: 0.15.sh,
                            height: 0.05.sh,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: AppColors.grey150,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
