import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:smartstruct/smartstruct.dart';
import 'package:ui_ux_designs/src/2_tasks/data/models/task_model.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';

part 'task_mapper.mapper.g.dart';

@Mapper()
abstract class TaskMapper {
  TaskDomain taskDomainByTaskModel(
    TaskModel taskModel,
  );

  TaskModel taskModelByTaskDomain(
    TaskDomain taskDomain,
  );
}
