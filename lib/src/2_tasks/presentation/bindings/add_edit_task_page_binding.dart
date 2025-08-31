import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/add_edit_task_page_controller.dart';

class AddEditTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddEditTaskPageController(
        logger: Get.find<Logger>(),
        tasksRepository: Get.find<TasksRepository>(),
      ),
      fenix: true,
    );
  }
}
