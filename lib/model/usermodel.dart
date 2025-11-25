class TaskModel {
  final String id;
  final String title;
  final String description;
  final String priority; // low, medium, high

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "priority": priority,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      priority: map["priority"],
    );
  }

  // ⭐ Proper copyWith method
  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? priority,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
    );
  }
}
