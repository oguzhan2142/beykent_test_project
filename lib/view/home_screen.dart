import 'package:flutter/material.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/model/todo.dart';
import 'package:flutter_test_project/view/add_todo_dialog.dart';
import 'package:flutter_test_project/view_model/home_view_model.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            context.read<HomeViewModel>().onFloatingActionBtnPressed(context),
      ),
      appBar: AppBar(
        title: Text(User.instance?.username ?? 'Home Page'),
      ),
      body: context.watch<HomeViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: context.read<HomeViewModel>().todos.length,
              itemBuilder: (context, index) {
                final todo = context.read<HomeViewModel>().todos[index];
                return ListTile(
                  onTap: () {
                    context
                        .read<HomeViewModel>()
                        .onTodoChecked(todo, !todo.isDone);
                  },
                  title: Text(todo.title),
                  leading: Icon(todo.isDone
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  selected: todo.isDone,
                );
              },
            ),
    );
  }
}
