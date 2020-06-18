import 'checkdigit.dart';

/// An instance of the default implementation of the [Luhn].
const luhn = Luhn();

/// A class that implements the Luhn checksum formula used to validate a
/// variety of identification numbers, such as credit card numbers, 
/// IMEI numbers, etc.
class Luhn extends CheckDigit<int> {
  ///
  const Luhn();

  static int _compute(
    String data, {
    bool hasCheckDigit = true,
  }) {
    var isDouble = !hasCheckDigit;
    var sum = 0;

    // 1. From the rightmost digit and moving left.
    for (var i = data.length - 1; i >= 0; i--) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      // The first digit doubled is the digit located 
      // immediately left of the check digit.
      if (isDouble) {
        final doubledDigit = digit * 2;
        // 2. Take the sum of all the digits.
        // If the result of this doubling operation 
        // is greater than 9 (e.g., 8 × 2 = 16),
        // then add the digits of the result.
        if (doubledDigit > 9) {
          // sum += doubledDigit ~/ 10 + doubledDigit % 10;
          sum += doubledDigit - 9;
        } else {
          sum += doubledDigit;
        }
      } else {
        sum += digit;
      }

      // ...double the value of every second digit.
      isDouble = !isDouble;
    }

    return sum;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length < 2) {
      return false;
    }

    // If the total modulo 10 is equal to 0 then the number is valid.
    return _compute(data) % 10 == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.isEmpty) {
      throw ArgumentError('Must not be null or empty');
    }

    final sum = _compute(data, hasCheckDigit: false);
    return (sum * 9) % 10;
  }
}
