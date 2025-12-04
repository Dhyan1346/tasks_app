import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String priority;        // low, medium, high
  final DateTime createdAt;     // ⭐ added
  final bool isDone;            // ⭐ added
  final int priorityValue;      // ⭐ NEW FIELD

  TaskModel({
    required this.id,
    required this.title,         // ⭐ only required
    required this.description,   // ⭐ only required
    this.priority = "Low",       // ⭐ default
    DateTime? createdAt,         // ⭐ default date
    this.isDone = false,         // ⭐ default
    this.priorityValue = 3,      // ⭐ default Low
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "priority": priority,
      "createdAt": createdAt,
      "isDone": isDone,
      "priorityValue": priorityValue,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"],
      title: map["title"],
      description: map["description"],
      priority: map["priority"] ?? "Low",
      createdAt: (map["createdAt"] as Timestamp).toDate(),
      isDone: map["isDone"] ?? false,
      priorityValue: map["priorityValue"] ?? 3,
    );
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? priority,
    DateTime? createdAt,
    bool? isDone,
    int? priorityValue,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      isDone: isDone ?? this.isDone,
      priorityValue: priorityValue ?? this.priorityValue,
    );
  }
}
