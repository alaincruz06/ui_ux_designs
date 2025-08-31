import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/data/datasources/tasks_provider_impl.dart';
import 'package:ui_ux_designs/src/2_tasks/data/models/task_model.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/mappers/task_mapper.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/custom_exception.dart';
import 'package:ui_ux_designs/src/common/utils/exceptions/provider_generic_exception.dart';

abstract class TasksRepository {
  Future<List<TaskDomain>> getTasksListForGivenDate({
    required DateTime dateTime,
  });

  Future<List<TaskDomain>> getTasksListForGivenMonth({
    required DateTime dateTime,
  });

  Future<TaskDomain?> getTaskById({
    required Id taskId,
  });

  Future<void> createOrEditTask({
    required TaskDomain taskDomain,
  });
}

class TasksRepositoryImpl extends TasksRepository {
  TasksRepositoryImpl({
    required this.logger,
    required this.tasksProvider,
    required this.taskMapper,
  });

  final Logger logger;
  final TasksProvider tasksProvider;
  final TaskMapper taskMapper;

  @override
  Future<List<TaskDomain>> getTasksListForGivenDate({
    required DateTime dateTime,
  }) async {
    try {
      final taskModelList = await tasksProvider.getTasksListForGivenDate(
        dateTime: dateTime,
      );
      return taskModelList
          .map((task) => taskMapper.taskDomainByTaskModel(task))
          .toList();
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<List<TaskDomain>> getTasksListForGivenMonth({
    required DateTime dateTime,
  }) async {
    try {
      final taskModelList = await tasksProvider.getTasksListForGivenMonth(
        dateTime: dateTime,
      );
      return taskModelList
          .map((task) => taskMapper.taskDomainByTaskModel(task))
          .toList();
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<TaskDomain?> getTaskById({
    required Id taskId,
  }) async {
    try {
      final taskModel = await tasksProvider.getTaskById(
        taskId: taskId,
      );
      if (taskModel != null) {
        return taskMapper.taskDomainByTaskModel(taskModel);
      } else {
        return null;
      }
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }

  @override
  Future<void> createOrEditTask({
    required TaskDomain taskDomain,
  }) async {
    try {
      final TaskModel taskModel = taskMapper.taskModelByTaskDomain(taskDomain);
      await tasksProvider.createOrEditTask(
        taskModel: taskModel,
      );
    } on ProviderGenericException catch (error) {
      logger.e("Error message: ${error.message}");
      throw CustomException(errorMessage: error.message, code: error.code);
    }
  }
}
