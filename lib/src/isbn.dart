import 'checkdigit.dart';

/// An instance of the default implementation of the [Isbn10].
const isbn10 = Isbn10();

/// A class that implements the ISBN-10 check digit algorithm.
class Isbn10 extends CheckDigit<int> {
  ///
  const Isbn10();

  static int _compute(String data) {
    var sum = 0;

    for (var i = 0; i < data.length; i++) {
      var digit = data.codeUnitAt(i) - 48;

      if (digit == 40 || digit == 72) {
        // At end.
        if (i == 9) {
          digit = 10;
        } else {
          throw ArgumentError('X is at an invalid index $i');
        }
      } else if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      sum += digit * (10 - i);
    }

    return sum;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length != 10) {
      return false;
    }

    return _compute(data) % 11 == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length != 9) {
      throw ArgumentError('Must not be null and must contain 9 digits');
    }

    return (11 - (_compute(data) % 11)) % 11;
  }
}

/// An instance of the default implementation of the [Isbn13].
const isbn13 = Isbn13();

/// A class that implements the ISBN-13 check digit algorithm.
class Isbn13 extends CheckDigit {
  ///
  const Isbn13();

  static int _compute(String data) {
    var sum = 0;
    var isThree = false;

    for (var i = 0; i < data.length; i++) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      if (isThree) {
        sum += digit * 3;
      } else {
        sum += digit;
      }

      isThree = !isThree;
    }

    return sum;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length != 13) {
      return false;
    }

    return _compute(data) % 10 == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length != 12) {
      throw ArgumentError('Must not be null and must contain 12 digits');
    }

    return (10 - (_compute(data) % 10)) % 10;
  }
}
