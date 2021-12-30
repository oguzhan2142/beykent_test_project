import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/repositories/repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final Repository repository;

  SignUpViewModel(this.repository);

  Future<String> signUp(String username, String password) async {
    User? user = createUser(username, password);

    if (user == null) {
      return "Invalid username or password";
    }
    bool isUserExist = await repository.isUsernameExist(username);

    if (isUserExist) {
      return "Username already exist";
    }

    await repository.saveUserToPref(user);

    return 'Sign up successful';
  }

  User? createUser(String username, String password) {
    User user = User(username: username, password: password);
    if (user.username.isEmpty || user.password.isEmpty) {
      return null;
    }
    return user;
  }
}
