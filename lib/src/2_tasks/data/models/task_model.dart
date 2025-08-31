import 'package:isar/isar.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';

part 'task_model.g.dart';

@collection
class TaskModel {
  // It can also be used id = null to auto increment
  Id id = Isar.autoIncrement;
  String? title;
  String? description;
  // To assign a color for easier visualization
  String? color;
  // The start/end dates of the task
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdDate;
  DateTime? editedDate;
  //To represent the type of the task
  @enumerated
  TaskType type = TaskType.event;
  //To represent the priority of the task
  @enumerated
  TaskPriority priority = TaskPriority.low;
  //To represent the repetition of the task
  @enumerated
  TaskRepetition repetition = TaskRepetition.none;
  //To represent the current state of the task
  @enumerated
  TaskStatus status = TaskStatus.notStarted;
  // (Optional) The comments in the task
  List<String>? comments;
  // (Optional) The members who are assigned/related to the task
  // Storing names and photos
  // -Workaround for Isar not supporting Maps or Objects
  List<String>? membersNames;
  List<byte>? membersPhotos;
  //To set notifications before the due date.
  List<DateTime>? reminders;
  // (Optional) The path of the attachments assigned to the task
  List<String>? attachmentsPaths;
  // (Optional) The mime/types of the attachments assigned to the task
  List<String>? attachmentsMimeTypes;
  // The activity historic log of the task
  List<String>? activity;
}
