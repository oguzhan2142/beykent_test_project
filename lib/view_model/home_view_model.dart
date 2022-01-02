import 'package:flutter/material.dart';

import 'package:flutter_test_project/model/todo.dart';
import 'package:flutter_test_project/repositories/repository.dart';
import 'package:flutter_test_project/view/add_todo_dialog.dart';

class HomeViewModel extends ChangeNotifier {
  final Repository repository;

  late List<Todo> todos;

  bool isLoading = true;

  HomeViewModel(this.repository) {
    getAllTodos();
  }

  void onFloatingActionBtnPressed(BuildContext context) async {
    Todo? todo = await showDialog<Todo>(
      context: context,
      builder: (_) => AddTodoDialog(),
    );

    if (todo != null) {
      await addTodo(todo);
    }

    await getAllTodos();
  }

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    List<Todo>? todos = await repository.getAllTodos();
    if (todos == null) {
      this.todos = [];
      return;
    }
    todos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    this.todos = todos;
    isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    await repository.addTodo(todo);
    notifyListeners();
  }

  void onTodoChecked(Todo todo, bool value) async {
    todo.isDone = value;
    await repository.updateTodo(todo);
    await getAllTodos();
    notifyListeners();
  }
}
