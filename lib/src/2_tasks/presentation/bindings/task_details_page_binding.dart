import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/task_details_page_controller.dart';

class TaskDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TaskDetailsPageController(
        logger: Get.find<Logger>(),
        tasksRepository: Get.find<TasksRepository>(),
      ),
      fenix: true,
    );
  }
}
