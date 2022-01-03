import 'package:flutter/material.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/view_model/home_view_model.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    context.read<HomeViewModel>().getAllTodos();

    });
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              User.instance == null;
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
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
                  subtitle: Row(
                    children: [
                      Text('Id: ${todo.id}'),
                      const Spacer(),
                      Text(todo.createdAt.toString()),
                    ],
                  ),
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
