import 'checksum.dart';

/// An instance of the default implementation of the [Isin].
const isin = Isin();

/// A class that implements the ISIN (International Securities Identification Numbers)
/// check digit algorithm.
class Isin extends Checksum {
  ///
  const Isin();

  static int _compute(
    String text, {
    bool hasCheckDigit = true,
  }) {
    final digits = <int>[];

    for (var i = 0; i < text.length; i++) {
      final c = text.codeUnitAt(i);

      if (c >= 65 && c <= 90) {
        final value = c - 55;
        digits.add(value ~/ 10);
        digits.add(value % 10);
      } else if (c >= 48 && c <= 57) {
        digits.add(c - 48);
      } else {
        throw ArgumentError('Invalid digit at index $i');
      }
    }

    var isTwo = !hasCheckDigit;
    var sum = 0;

    for (var i = digits.length - 1; i >= 0; i--) {
      if (isTwo) {
        final value = digits[i] * 2;

        if (value > 9) {
          sum += (value ~/ 10) + (value % 10);
        } else {
          sum += value;
        }
      } else {
        sum += digits[i];
      }

      isTwo = !isTwo;
    }

    return sum;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length < 4) {
      return false;
    }

    return _compute(data) % 10 == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length < 4) {
      throw ArgumentError(
        'Must be not null and must contain at least 4 digits',
      );
    }

    final sum = _compute(data, hasCheckDigit: false);
    return ((sum / 10).ceil() * 10) - sum;
  }
}
