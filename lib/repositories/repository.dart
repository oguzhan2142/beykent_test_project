import 'package:flutter_test_project/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static const String _users = 'users';

  static Future<User?> getUserFromPref(String username) async {
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

  static Future<bool> isUsernameExist(String username) async {
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

  static Future<void> saveUserToPref(User user) async {
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
