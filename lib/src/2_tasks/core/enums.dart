//Must be the same length as: @List<Color> tasksColors
enum TaskType { event, birthday, countdown }

enum TaskPriority { low, medium, high }

enum TaskRepetition { none, daily, weekly, monthly, yearly }

enum TaskStatus {
  notStarted,
  inProgress,
  completed,
  overdue,
}
