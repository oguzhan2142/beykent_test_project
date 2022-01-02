import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets('should start with screen which has [Sign In] button',
  //     (WidgetTester tester) async {
  //   app.main();
  //   await tester.pumpAndSettle();

  //   expect(find.text('Sign In'), findsOneWidget);
  // });

  // testWidgets(
  //     'should stay at same screen when tap Sign In with empty creaentials',
  //     (WidgetTester tester) async {
  //   app.main();
  //   await tester.pumpAndSettle();

  //   Finder signUpBtn = find.text('Sign In');

  //   await tester.tap(signUpBtn);

  //   await tester.pumpAndSettle();

  //   expect(find.text('Sign In'), findsOneWidget);
  // });

  testWidgets(
      'should pop from sign_up to sign_in after successfull sign up processs',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    Finder routeBtn = find.text('If you dont have an account Sign Up');

    await tester.tap(routeBtn);

    await tester.pumpAndSettle();

    // expect(find.text('Sign Up'), findsOneWidget);
   


    Finder usernameSignUpWidget = find.bySemanticsLabel('Username');
    Finder password1SignUpWidget = find.byKey(const Key('password1'));
    Finder password2SignUpWidget = find.byKey(const Key('password2'));

    expect(usernameSignUpWidget, findsOneWidget);
    expect(password1SignUpWidget, findsOneWidget);
    expect(password2SignUpWidget, findsOneWidget);

    Random random = Random();

    String username = 'username${random.nextInt(1000)}';
    String password = 'password${random.nextInt(1000)}';
    await tester.enterText(usernameSignUpWidget, username);
    await tester.enterText(password1SignUpWidget, password);
    await tester.enterText(password2SignUpWidget, password);

    await tester.pumpAndSettle();

    await tester.pageBack();

    await tester.pumpAndSettle();

    Finder usernameSignInWidget = find.bySemanticsLabel('Username');
    Finder passwordSignInWidget = find.bySemanticsLabel('Password');

    await tester.enterText(usernameSignInWidget, username);
    await tester.enterText(passwordSignInWidget, password);

    Finder signInBtn = find.text('Sign In');

    await tester.tap(signInBtn);
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
  });
}
