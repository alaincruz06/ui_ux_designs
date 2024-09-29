import 'package:get/get.dart';
import 'package:ui_ux_designs/common/app/constants/assets.dart';
import 'package:ui_ux_designs/src/common/app/routes/app_pages.dart';

class HomePageController extends GetxController {
  HomePageController();

  final routes = [
    (
      Assets.assetsSvgsPokemon,
      'app.pokedex'.tr,
    ),
  ];

/*   @override
  void onInit() async {
    super.onInit();
  }
 */

  Future<void> navigateToPages(int index) async {
    switch (index) {
      case 0:
        await Get.toNamed(
          Routes.pokedexHome,
        );
    }
  }
}
