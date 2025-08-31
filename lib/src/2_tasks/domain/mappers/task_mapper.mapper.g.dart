// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class TaskMapperImpl extends TaskMapper {
  TaskMapperImpl() : super();

  @override
  TaskDomain taskDomainByTaskModel(TaskModel taskModel) {
    final taskdomain = TaskDomain(
      id: taskModel.id.toString(),
      title: taskModel.title,
      description: taskModel.description,
      color: taskModel.color,
      startDate: taskModel.startDate,
      endDate: taskModel.endDate,
      createdDate: taskModel.createdDate,
      editedDate: taskModel.editedDate,
      type: taskModel.type,
      priority: taskModel.priority,
      repetition: taskModel.repetition,
      status: taskModel.status,
      comments: taskModel.comments?.map((e) => e).toList(),
      membersNames: taskModel.membersNames?.map((e) => e).toList(),
      membersPhotos: taskModel.membersPhotos?.map((e) => byte).toList()
          as List<Uint8List>?,
      reminders: taskModel.reminders?.map((e) => e).toList(),
      attachmentsPaths: taskModel.attachmentsPaths?.map((e) => e).toList(),
      attachmentsMimeTypes:
          taskModel.attachmentsMimeTypes?.map((e) => e).toList(),
      activity: taskModel.activity?.map((e) => e).toList(),
    );
    return taskdomain;
  }

  @override
  TaskModel taskModelByTaskDomain(TaskDomain taskDomain) {
    final taskmodel = TaskModel();
    // taskmodel.id = taskDomain.id != null ? Id.parse(taskDomain.id!) : null;
    taskmodel.title = taskDomain.title;
    taskmodel.description = taskDomain.description;
    taskmodel.color = taskDomain.color;
    taskmodel.startDate = taskDomain.startDate;
    taskmodel.endDate = taskDomain.endDate;
    taskmodel.createdDate = taskDomain.createdDate;
    taskmodel.editedDate = taskDomain.editedDate;
    taskmodel.type = taskDomain.type;
    taskmodel.priority = taskDomain.priority;
    taskmodel.repetition = taskDomain.repetition;
    taskmodel.status = taskDomain.status;
    taskmodel.comments = taskDomain.comments?.map((e) => e).toList();
    taskmodel.membersNames = taskDomain.membersNames?.map((e) => e).toList();
    taskmodel.membersPhotos =
        taskDomain.membersPhotos?.map((e) => e).toList() as List<byte>?;
    taskmodel.reminders = taskDomain.reminders?.map((e) => e).toList();
    taskmodel.attachmentsPaths =
        taskDomain.attachmentsPaths?.map((e) => e).toList();
    taskmodel.attachmentsMimeTypes =
        taskDomain.attachmentsMimeTypes?.map((e) => e).toList();
    taskmodel.activity = taskDomain.activity?.map((e) => e).toList();
    return taskmodel;
  }
}
