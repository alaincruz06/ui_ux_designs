import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/common/app/constants/assets.dart';
import 'package:ui_ux_designs/src/2_tasks/core/tasks_utils.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/task_details_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/task_details_page/widgets/task_activity_widget.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/task_details_page/widgets/task_overview_widget.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: kpagePadding / 2),
        child: Scaffold(
          body: GetBuilder<TaskDetailsPageController>(
            builder: (controller) {
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(kpagePadding / 2),
                    color: controller.taskColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new_sharp),
                              onPressed: () => Get.back(),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.share_outlined),
                                  iconSize: kiconSize * 1.15,
                                  onPressed: () async =>
                                      await controller.shareTask(),
                                ),
                                10.horizontalSpace,
                                InkWell(
                                  child: SvgPicture.asset(
                                    Assets.assetsSvgsEdit,
                                    width: kiconSize * 1.15,
                                    height: kiconSize * 1.153,
                                  ),
                                ),
                                10.horizontalSpace,
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kpagePadding,
                          ),
                          child: SizedBox(
                            height: 0.15.sh,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controller.taskDomain!.title ?? '',
                                    style: tasksTextStyleTitle3Bold,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'app.startDate'.tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: tasksTextStyleCaptionBold,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.calendar_month_rounded),
                                            5.horizontalSpace,
                                            Text(
                                                TasksUtils()
                                                    .tasksDateFormat
                                                    .format(controller
                                                        .taskDomain!.startDate!)
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: tasksTextStyleSmallBody),
                                          ],
                                        ),
                                      ],
                                    ),
                                    10.verticalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'app.endDate'.tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: tasksTextStyleCaptionBold,
                                          maxLines: 2,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.calendar_month_rounded),
                                            5.horizontalSpace,
                                            Text(
                                                TasksUtils()
                                                    .tasksDateFormat
                                                    .format(controller
                                                        .taskDomain!.endDate!)
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: tasksTextStyleSmallBody),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.72.sh,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(roundCornerForTask),
                        topRight: Radius.circular(roundCornerForTask),
                      ),
                      color: TaskColors.taskColorBg,
                    ),
                    padding: const EdgeInsets.only(
                      left: kpagePadding,
                      right: kpagePadding,
                      top: roundCornerForTask / 3.7,
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          backgroundColor: TaskColors.taskColorBg,
                          toolbarHeight: 0,
                          leading: null,
                          automaticallyImplyLeading: false,
                          bottom: TabBar(
                            tabs: [
                              Tab(
                                text: 'app.overview'.tr,
                              ),
                              Tab(
                                text: 'app.activity'.tr,
                              ),
                            ],
                            labelColor: controller.taskColor,
                            indicatorColor: controller.taskColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 3,
                          ),
                        ),
                        body: const TabBarView(
                          children: [
                            TaskOverviewWidget(),
                            TaskActivityWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
