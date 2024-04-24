class TodoTaskModel {
  String id;
  String? name;
  String? date;
  String? priority;

  TodoTaskModel({
    required this.id,
    required this.name,
    required this.date,
    required this.priority,
  });

  @override
  String toString() {
    return 'Task{id: $id, name: $name, date: $date, priority: $priority}';
  }
}
