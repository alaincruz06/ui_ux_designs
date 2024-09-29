import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/controllers/pokemon_details_page_controller.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/pages/pokemon_details/widgets/pokemon_details_bottom_widget.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/pages/pokemon_details/widgets/pokemon_details_top_widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonDetailsPageController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: controller.colors!.first,
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 0.29.sh,
                    child: const PokemonDetailsTopWidget(),
                  ),
                  //Body
                  SizedBox(
                    height: 0.604.sh,
                    child: const PokemonDetailsBottomWidget(),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
