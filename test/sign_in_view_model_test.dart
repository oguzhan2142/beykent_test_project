import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/repositories/repository.dart';
import 'package:flutter_test_project/view_model/sign_in_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_view_model_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late SignInViewModel signInViewModel;
  late MockRepository mockRepository;
  setUp(() {
    mockRepository = MockRepository();
    signInViewModel = SignInViewModel(mockRepository);
  });

  test('should give [User not found] message if user doesnt exist', () async {
    // arrange
    const username = 'beykent';
    const password = '123';
    const expectedMessage = 'User not found';

    when(mockRepository.getUserFromPref(any)).thenAnswer(
      (_) => Future.value(null),
    );
    // act
    String message = await signInViewModel.signIn(username, password);
    // assert
    expect(message, expectedMessage);
  });

  test('should return empty string when sign in success', () async {
    // arrange
    const username = 'beykent';
    const password = '123';
    const expectedMessage = '';

    final User existingUser = User(username: username, password: password);
    when(mockRepository.getUserFromPref(any)).thenAnswer(
      (_) => Future.value(existingUser),
    );

    // act
    String message = await signInViewModel.signIn(username, password);

    // assert
    expect(message, expectedMessage);
  });
}
