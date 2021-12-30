import 'package:flutter/material.dart';
import 'package:flutter_test_project/home_screen.dart';
import 'package:flutter_test_project/sign_in_screen.dart';
import 'package:flutter_test_project/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      routes: {
        '/': (context) => SignInScreen(),
        'sign_in': (context) =>  SignInScreen(),
        'sign_up': (context) =>  SignUpScreen(),
        'home': (context) => const HomeScreen(),
      },

    );
  }
}
