import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_1/maths_utils.dart';

void main() {
  group('Math utils - ', () {
    test('Check for two numbers addition', () {
      // Arrange
      var a = 10;
      var b = 10;

      //Act
      var sum = add(a, b);

      //Assert
      expect(sum, 20);
    });

    test('Check for two numbers subtraction', () {
      // Arrange
      var a = 10;
      var b = 10;

      //Act
      var sum = subtract(a, b);

      //Assert
      expect(sum, 0);
    });

    test('Check for two numbers multiply', () {
      // Arrange
      var a = 10;
      var b = 10;

      //Act
      var sum = multiply(a, b);

      //Assert
      expect(sum, 100);
    });
  });
}
