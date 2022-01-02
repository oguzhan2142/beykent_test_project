import 'dart:convert';

class Todo {
  final String title;
  final DateTime createdAt;
  final bool isDone;

  
  Todo({
    required this.title,
    required this.createdAt,
    required this.isDone,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
