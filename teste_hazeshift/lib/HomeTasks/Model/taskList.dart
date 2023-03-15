class TaskList {
  String taskItems;
  bool taskDone;
//  Map<String, bool> teste;

  TaskList({
    required this.taskItems,
    required this.taskDone,
  });

  static TaskList fromJson(json) =>
      TaskList(taskItems: json['taskItems'], taskDone: json['taskDone']);
}
