import 'package:get/get.dart';
import 'package:ui_ux_designs/src/common/presentation/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(),
      fenix: true,
    );
  }
}
