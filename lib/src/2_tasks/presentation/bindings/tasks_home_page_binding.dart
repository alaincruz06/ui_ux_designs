import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/tasks_home_page_controller.dart';

class TasksHomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TasksHomePageController(
        tasksRepository: Get.find<TasksRepository>(),
        logger: Get.find<Logger>(),
      ),
      fenix: true,
    );
  }
}
