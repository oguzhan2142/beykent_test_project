import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/model/User.dart';
import 'package:flutter_test_project/view_model/sign_up_view_model.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_view_model_test.mocks.dart';

void main() {
  late SignUpViewModel signUpViewModel;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    signUpViewModel = SignUpViewModel(mockRepository);
  });

  group('signUp Method', () {
    
    test(
        'should return [Invalid username or password] message when username is empty',
        () async {
      // arrange
      const expectedMessage = 'Invalid username or password';
      const username = '';
      const password = '123456';
      // act
      String message = await signUpViewModel.signUp(username, password);

      // assert
      expect(message, expectedMessage);
    });

    test(
        'should return [Invalid username or password] message when password is empty',
        () async {
      // arrange
      const expectedMessage = 'Invalid username or password';
      const username = 'beykent';
      const password = '';
      // act
      String message = await signUpViewModel.signUp(username, password);

      // assert
      expect(message, expectedMessage);
    });

    test('should return [Username already exist] message if user already exists',
        () async {
      // arrange
      const expectedMessage = 'Username already exist';
      const username = 'beykent';
      const password = '123';

      when(mockRepository.isUsernameExist(username))
          .thenAnswer((_) async => true);

      // act
      String message = await signUpViewModel.signUp(username, password);

      // assert
      expect(message, expectedMessage);
    });

      test('should return [Sign up successful] message when credentials are valid and user doesnt exists',
        () async {
      // arrange
      const expectedMessage = 'Sign up successful';
      const username = 'beykent';
      const password = '123';

      when(mockRepository.isUsernameExist(username))
          .thenAnswer((_) async => false);

      // act
      String message = await signUpViewModel.signUp(username, password);

      // assert
      expect(message, expectedMessage);
    });


  });

  group('createUser Method', () {
    test('should createUser method should give null when username is empty',
        () {
      // arrange
      const username = '';
      const password = 'password';

      // act
      User? user = signUpViewModel.createUser(username, password);

      // assert
      expect(user, isNull);
    });

    test('should createUser method should give null when password is empty',
        () {
      // arrange
      const username = 'username';
      const password = '';

      // act
      User? user = signUpViewModel.createUser(username, password);

      // assert
      expect(user, isNull);
    });
  });
}
