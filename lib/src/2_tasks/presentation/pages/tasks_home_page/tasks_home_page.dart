import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/tasks_home_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/tasks_home_page/widgets/task_widget.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';

class TasksHomePage extends StatelessWidget {
  const TasksHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksHomePageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('app.tasks'.tr),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'app.manageYourTasks'.tr,
                  overflow: TextOverflow.ellipsis,
                  style: tasksTextStyleTitle1Bold,
                  maxLines: 2,
                ),
                10.verticalSpace,
                AdvancedCalendar(
                  controller: controller.advancedCalendarController,
                  showNavigationArrows: true,
                  innerDot: true,
                  startWeekDay: 1,
                  weekLineHeight: 48.0,
                  events: controller.events,
                ),
                20.verticalSpace,
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.dailyTasks.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TaskWidget(
                      task: controller.dailyTasks[index],
                      shareTask: (task) => controller.shareTask(task),
                      openTask: (task) => controller.openTask(task),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => await controller.createTask(),
          child: const Icon(
            Icons.add,
          ),
        ),
      );
    });
  }
}
