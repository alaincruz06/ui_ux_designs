import 'dart:typed_data';

import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';

class TaskDomain {
  TaskDomain({
    this.id,
    this.title,
    this.description,
    this.color,
    this.startDate,
    this.endDate,
    this.createdDate,
    this.editedDate,
    required this.type,
    required this.priority,
    required this.repetition,
    required this.status,
    this.comments,
    this.membersNames,
    this.membersPhotos,
    this.reminders,
    this.attachmentsPaths,
    this.attachmentsMimeTypes,
    this.activity,
  });

  String? id;
  String? title;
  String? description;
  String? color;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdDate;
  DateTime? editedDate;
  TaskType type;
  TaskPriority priority;
  TaskRepetition repetition;
  TaskStatus status;
  List<String>? comments;
  List<String>? membersNames;
  List<Uint8List?>? membersPhotos;
  List<DateTime>? reminders;
  List<String>? attachmentsPaths;
  List<String>? attachmentsMimeTypes;
  List<String>? activity;
}
