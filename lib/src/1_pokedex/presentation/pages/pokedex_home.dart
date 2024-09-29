import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/domain_models/pokemon_name_and_url_domain.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokedex_home_page_controller.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/widgets/loading_pokemon_list_shimmer_widget.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/widgets/pokemon_single_item.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/widgets/shimmer_pokemon_list_tile.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/custom_text_form_field.dart';

class PokedexHomePage extends StatelessWidget {
  const PokedexHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('app.pokedex'.tr),
      ),
      body: GetBuilder<PokedexHomePageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: CustomTextFormField(
                  controller: controller.searchController,
                  hintText: 'app.search'.tr,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (p0) async => await controller.searchPokemons(),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async =>
                            await controller.searchPokemons(),
                        icon: const Icon(Icons.search_outlined),
                      ),
                      controller.searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () async =>
                                  await controller.clearFilter(),
                              icon: const Icon(Icons.close),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 0.82.sh,
                child: RefreshIndicator(
                  onRefresh: () async => controller.refreshResults(),
                  child: PagedGridView<int, PokemonNameAndUrlDomain>(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                    ),
                    showNewPageProgressIndicatorAsGridChild: false,
                    showNewPageErrorIndicatorAsGridChild: false,
                    pagingController: controller.pagingController,
                    scrollController: controller.scrollController,
                    builderDelegate: PagedChildBuilderDelegate(
                      newPageErrorIndicatorBuilder: (_) => Column(
                        children: [
                          20.verticalSpace,
                          Center(
                            child: Text('app.unknownConnectionErrorFromApi'.tr),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                      firstPageErrorIndicatorBuilder: (_) => Center(
                        child: Text('app.unknownConnectionErrorFromApi'.tr),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: Text('app.nothingFound'.tr),
                      ),
                      firstPageProgressIndicatorBuilder: (_) =>
                          const LoadingPokemonListShimmerWidget(
                        amountOfPokemons: 5,
                      ),
                      newPageProgressIndicatorBuilder: (_) =>
                          controller.searchController.text.isEmpty
                              ? const LoadingPokemonListShimmerWidget(
                                  amountOfPokemons: 4,
                                )
                              : const SizedBox(),
                      itemBuilder: (context, item, index) =>
                          FutureBuilder<(List<Color>, PokemonDomain)?>(
                        future: controller.getPokemonDetails(
                          name: controller.pokemonList[index].name ?? '',
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final colorAndpokemon = snapshot.data!;
                            return PokemonSingleItem(
                              onTap: () async =>
                                  await controller.getToPokemonDetails(
                                colorAndpokemon.$2,
                                colorAndpokemon.$1,
                              ),
                              pokemon: colorAndpokemon.$2,
                              colors: colorAndpokemon.$1,
                            );
                          } else {
                            return const ShimmerPokemonListTile();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
