import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';
import 'package:ui_ux_designs/src/2_tasks/core/tasks_utils.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';
import 'package:ui_ux_designs/src/common/utils/aux_functions.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    required this.task,
    required this.shareTask,
    required this.openTask,
    super.key,
  });

  final TaskDomain task;
  final void Function(TaskDomain) shareTask;
  final void Function(TaskDomain) openTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openTask(task),
      child: Container(
        height: 0.27.sh,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(25.r),
          color: AuxFunctions.hexToColor(task.color!),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 0.035.sh,
                    width: 0.25.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'app.taskPriority_${task.priority.name}'.tr,
                        style: tasksTextStyleCaptionBold.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () => shareTask(task),
                    icon: const Icon(Icons.share),
                    color: Colors.white,
                  ),
                ],
              ),
              5.verticalSpace,
              Text(
                task.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: tasksTextStyleTitle3Bold,
                maxLines: 2,
              ),
              5.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'app.taskStatus_${task.status.name}'.tr,
                    overflow: TextOverflow.ellipsis,
                    style: tasksTextStyleBody.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  5.horizontalSpace,
                  taskStatusIcon(task.status),
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Icon(
                      Icons.calendar_month_rounded,
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    TasksUtils()
                        .tasksDateFormat
                        .format(task.startDate!)
                        .toString(),
                    overflow: TextOverflow.ellipsis,
                    style: tasksTextStyleBody,
                  ),
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  task.comments != null && task.comments!.isNotEmpty
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.chat_outlined),
                            5.horizontalSpace,
                            Text(
                              task.comments!.length.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: tasksTextStyleCaption.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  10.horizontalSpace,
                  task.attachmentsPaths != null &&
                          task.attachmentsPaths!.isNotEmpty
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.attachment_rounded,
                            ),
                            5.horizontalSpace,
                            Text(
                              task.attachmentsPaths!.length.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: tasksTextStyleCaption.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget taskStatusIcon(TaskStatus status) {
  switch (status) {
    case TaskStatus.notStarted:
      return const Icon(Icons.hourglass_empty_rounded);
    case TaskStatus.inProgress:
      return const Icon(Icons.play_circle_outline_rounded);
    case TaskStatus.completed:
      return const Icon(Icons.check_circle_outline);
    case TaskStatus.overdue:
      return const Icon(Icons.warning_amber_rounded);
    default:
      return const Icon(Icons.circle_outlined);
  }
}
