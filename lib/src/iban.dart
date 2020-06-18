import 'checkdigit.dart';

/// An instance of the default implementation of the [Iban].
const iban = Iban();

/// A class that implements the IBAN (International Bank Account Number)
/// check digit algorithm.
class Iban extends CheckDigit<int> {
  ///
  const Iban();

  static int _compute(String text) {
    final digits = <int>[];

    for (var i = 0; i < text.length; i++) {
      final c = text.codeUnitAt(i);

      if (c >= 65 && c <= 90) {
        final value = c - 55;
        digits.add(value ~/ 10);
        digits.add(value % 10);
      } else if (c >= 97 && c <= 122) {
        final n = c - 87;
        digits.add(n ~/ 10);
        digits.add(n % 10);
      } else if (c >= 48 && c <= 57) {
        digits.add(c - 48);
      } else {
        throw ArgumentError('Invalid digit at index $i');
      }
    }

    var sum = 0;

    for (final d in digits) {
      sum = (sum * 10 + d) % 97;
    }

    return sum;
  }

  @override

  /// Validates the [data] integrity.
  /// It assumes that the check digits start at index 2 of [data].
  bool validate(String data) {
    if (data == null || data.length < 5) {
      return false;
    }

    data = '${data.substring(4)}${data.substring(0, 4)}';

    return _compute(data) == 1;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length < 5) {
      throw ArgumentError(
        'Must not be null and must contain at least 5 digits',
      );
    }

    data = '${data.substring(4)}${data.substring(0, 2)}00';

    final sum = _compute(data);

    return 98 - sum;
  }
}
