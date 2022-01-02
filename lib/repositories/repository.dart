import 'dart:convert';

import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/model/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final String _users = 'users';
  final String _todos = 'todos';

  Future<List<Todo>?> getAllTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todos = prefs.getStringList(_todos);

    return todos?.map((todo) => Todo.fromJson(json.decode(todo))).toList();
  }


  Future<void> addTodo(Todo todo)async{
    final prefs = await SharedPreferences.getInstance();
    final todos = prefs.getStringList(_todos) ?? [];
    todos.add(json.encode(todo));
    prefs.setStringList(_todos, todos);

  }

  Future<User?> getUserFromPref(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? userList = prefs.getStringList(_users);
    if (userList == null) {
      return null;
    }

    List<User> users = userList.map((user) => User.fromJson(user)).toList();

    for (var user in users) {
      if (user.username == username) {
        return user;
      }
    }
    return null;
  }

  Future<bool> isUsernameExist(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existinguserList = prefs.getStringList(_users);
    if (existinguserList == null) {
      return false;
    }
    for (var item in existinguserList) {
      if (item.contains(username)) {
        return true;
      }
    }

    return false;
  }

  Future<void> saveUserToPref(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? existinguserList = prefs.getStringList(_users);

    if (existinguserList == null) {
      prefs.setStringList(_users, <String>[user.toJson()]);
    } else {
      existinguserList.add(user.toJson());
      prefs.setStringList(_users, existinguserList);
    }
  }
}
