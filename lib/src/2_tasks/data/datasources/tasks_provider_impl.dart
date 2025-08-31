import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/data/models/task_model.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/provider_generic_exception.dart';

abstract class TasksProvider {
  Future<List<TaskModel>> getTasksListForGivenDate({
    required DateTime dateTime,
  });

  Future<List<TaskModel>> getTasksListForGivenMonth({
    required DateTime dateTime,
  });

  Future<TaskModel?> getTaskById({
    required Id taskId,
  });

  Future<void> createOrEditTask({
    required TaskModel taskModel,
  });
}

class TasksProviderImpl extends TasksProvider {
  TasksProviderImpl({
    required this.logger,
    required this.isar,
  });

  final Isar isar;
  final Logger logger;

  @override
  Future<List<TaskModel>> getTasksListForGivenDate({
    required DateTime dateTime,
  }) async {
    try {
      return isar.taskModels
          .filter()
          .startDateLessThan(dateTime)
          .and()
          .endDateGreaterThan(dateTime)
          .or()
          .startDateBetween(
            dateTime,
            dateTime.copyWith(
              hour: 23,
              minute: 59,
              second: 59,
            ),
          )
          .or()
          .endDateBetween(
            dateTime,
            dateTime.copyWith(
              hour: 23,
              minute: 59,
              second: 59,
            ),
          )
          .sortByStartDate()
          .findAll();
    } catch (e) {
      logger.e('Isar Exception on getTasksListForGivenDate: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<List<TaskModel>> getTasksListForGivenMonth({
    required DateTime dateTime,
  }) async {
    try {
      return isar.taskModels
          .filter()
          .startDateGreaterThan(dateTime)
          .and()
          .endDateLessThan(
            dateTime.copyWith(month: dateTime.month + 1),
          )
          .sortByStartDate()
          .findAll();
    } catch (e) {
      logger.e('Isar Exception on getTasksListForGivenMonth: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<TaskModel?> getTaskById({
    required Id taskId,
  }) async {
    try {
      return await isar.taskModels.get(taskId);
    } catch (e) {
      logger.e('Isar Exception on getTaskById: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }

  @override
  Future<void> createOrEditTask({
    required TaskModel taskModel,
  }) async {
    try {
      await isar.writeTxn(() async {
        await isar.taskModels.put(taskModel);
      });
    } catch (e) {
      logger.e('Isar Exception on createTask: $e');
      throw ProviderGenericException(codeUnknown.toString(), "errorGeneric");
    }
  }
}
