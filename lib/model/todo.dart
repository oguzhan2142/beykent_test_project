import 'dart:convert';

class Todo {
  final int id;
  final String title;
  final DateTime createdAt;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isDone,
  });


  Todo copyWith({
    int? id,
    String? title,
    DateTime? createdAt,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, createdAt: $createdAt, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Todo &&
      other.id == id &&
      other.title == title &&
      other.createdAt == createdAt &&
      other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      createdAt.hashCode ^
      isDone.hashCode;
  }
}
