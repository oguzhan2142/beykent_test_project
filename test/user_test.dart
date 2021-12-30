import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/model/User.dart';

void main() {
  test('should toJson string contains correct username and password', () {
    // arrange
    const String expectedUsername = 'beykent';
    const String expectedPassword = '123456';
    User user = User(username: expectedUsername, password: expectedPassword);

    // act
    String json = user.toJson();

    // assert
    expect(json, contains(expectedUsername));
    expect(json, contains(expectedPassword));
  });

  test('should fromJson gives User with correct username and password', () {
    // arrange
    const String expectedUsername = 'beykent';
    const String expectedPassword = '123456';
    String json =
        '{"username":"$expectedUsername","password":"$expectedPassword"}';

    // act
    User user = User.fromJson(json);

    // assert
    expect(user.username, expectedUsername);
    expect(user.password, expectedPassword);
  });
}
