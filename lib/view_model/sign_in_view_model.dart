import 'package:flutter/material.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/repositories/repository.dart';

class SignInViewModel extends ChangeNotifier {
  final Repository repository;

  SignInViewModel(this.repository);

  Future<String> signIn(String username, String password) async {
    User? user = await repository.getUserFromPref(username);

    if (user == null) {
      return "User not found";
    }

    if (password == user.password) {
      return "";
    } else {
      return "Wrong password";
    }
  }
}
