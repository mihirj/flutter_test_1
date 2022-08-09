import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_1/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Login Flow Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'Should show Required Field error message when user taps on login button without entering email id and password',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      Finder loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder errorText = find.text('Required Field');

      expect(errorText, findsNWidgets(2));
    });

    testWidgets(
        'Should show home screen when user taps on login button after entering valid email id and password',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      Finder userNameTextField = find.byKey(const ValueKey('email_id'));
      Finder passwordTextField = find.byKey(const ValueKey('password'));

      await tester.enterText(userNameTextField, 'abc@example.com');
      await tester.enterText(passwordTextField, 'password ');

      Finder loginButton = find.byType(ElevatedButton);

      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder welcomeText = find.byType(Text);

      expect(welcomeText, findsOneWidget);
    });
  });
}
