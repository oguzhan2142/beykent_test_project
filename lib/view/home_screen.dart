import 'package:flutter/material.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/view_model/home_view_model.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<HomeViewModel>().addTodo(todo);
        },
      ),
      appBar: AppBar(
        title: Text(User.instance?.username ?? 'Home Page'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
