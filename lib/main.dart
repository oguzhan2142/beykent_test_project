import 'package:flutter/material.dart';
import 'package:flutter_test_project/view/home_screen.dart';
import 'package:flutter_test_project/view/sign_in_screen.dart';
import 'package:flutter_test_project/view/sign_up_screen.dart';
import 'package:flutter_test_project/view_model/sign_in_view_model.dart';
import 'package:flutter_test_project/view_model/sign_up_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SignInViewModel>(create: (_) => SignInViewModel()),
      ChangeNotifierProvider<SignUpViewModel>(create: (_) => SignUpViewModel()),
    ],
    child: const MyApp(),
  ));
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
        'sign_up': (context) => SignUpScreen(),
        'home_screen': (context) => const HomeScreen(),
      },
    );
  }
}
