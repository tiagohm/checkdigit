import 'checkdigit.dart';

/// An instance of the default implementation of the [Ean]
/// for 13-digit identifier number.
const ean13 = Ean(13);

/// An instance of the default implementation of the [Ean]
/// for 8-digit identifier number.
const ean8 = Ean(8);

/// An instance of the default implementation of the
/// UPC-A check digit algorithm.
const upcA = Ean(12);

/// A class that implements the EAN-X check digit algorithm.
class Ean extends CheckDigit {
  /// Number of digits.
  final int n;

  ///
  const Ean(this.n) : assert(n != null && n > 1);

  static int _compute(
    String data, {
    bool hasCheckDigit = false,
  }) {
    var sum = 0;
    var isThree = !hasCheckDigit;

    for (var i = data.length - 1; i >= 0; i--) {
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
    if (data == null || data.length != n) {
      return false;
    }

    return _compute(data, hasCheckDigit: true) % 10 == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length != n - 1) {
      throw ArgumentError('Must not be null and must contain ${n - 1} digits');
    }

    return (10 - (_compute(data) % 10)) % 10;
  }

  @override
  String checkDigitAsString(String data) {
    return '${checkDigit(data)}';
  }
}
