import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_1/validator.dart';

void main() {
  /// Email Test
  test('Validate for empty email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('');

    //Assert
    expect(result, 'Required Field');
  });

  test('Validate for invalid email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('sdfsdfsdf');

    //Assert
    expect(result, 'Please enter a valid email id');
  });

  test('Validate for valid email id', () {
    //Arrange & Act
    var result = Validator.validateEmail('abc@example.com');

    //Assert
    expect(result, null);
  });

  /// Password Test
  test('Validate for empty password', () {
    //Arrange & Act
    var result = Validator.validatePassword('');

    //Assert
    expect(result, 'Required Field');
  });

  test('Validate for invalidate length password', () {
    //Arrange & Act
    var result = Validator.validatePassword('passwor');

    //Assert
    expect(result, 'Please enter minimum 8 characters in password');
  });

  test('Validate for valid password', () {
    //Arrange & Act
    var result = Validator.validatePassword('password');

    //Assert
    expect(result, null);
  });
}
