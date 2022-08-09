import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_1/login_screen.dart';

void main() {
  testWidgets('Should have a title', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Act
    Finder title = find.byKey(const ValueKey('appBar'));

    //Assert
    expect(title, findsOneWidget);
  });

  testWidgets('Should have one textField form to collect user email id',
      (WidgetTester tester) async {
    //Arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // Act
    Finder userNameTextField = find.byKey(const ValueKey('email_id'));

    expect(userNameTextField, findsOneWidget);
  });

  testWidgets('Should have one textField form to collect user password',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    Finder passwordTextField = find.byKey(const ValueKey('password'));

    expect(passwordTextField, findsOneWidget);
  });

  testWidgets('Should have a one login button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    Finder loginButton = find.byType(ElevatedButton);

    expect(loginButton, findsOneWidget);
  });

  testWidgets(
      'Should show Required Field error message if user email id & password is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    Finder loginButton = find.byType(ElevatedButton);

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder errorText = find.text('Required Field');

    expect(errorText, findsNWidgets(2));
  });

  testWidgets('Should submit form when user email id & password is valid',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginScreen()),
    );

    Finder userNameTextField = find.byKey(const ValueKey('email_id'));
    Finder passwordTextField = find.byKey(const ValueKey('password'));

    await tester.enterText(userNameTextField, 'user@example.com');
    await tester.enterText(passwordTextField, 'password');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder errorTexts = find.text('Required Field');

    expect(errorTexts, findsNothing);
  });
}
