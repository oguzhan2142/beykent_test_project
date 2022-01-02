import 'package:flutter/material.dart';

import 'package:flutter_test_project/model/todo.dart';
import 'package:flutter_test_project/repositories/repository.dart';

class HomeViewModel extends ChangeNotifier {
  final Repository repository;

  late List<Todo> todos;

  HomeViewModel(this.repository);

  Future<void> getAllTodos() async {
    List<Todo>? todos = await repository.getAllTodos();
    if (todos == null) {
      this.todos = [];
      return;
    }
    this.todos = todos;
  }

  void addTodo(Todo todo) async {
    await repository.addTodo(todo);
    notifyListeners();
  }
}
