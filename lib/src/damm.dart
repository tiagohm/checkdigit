import 'package:checkdigit/src/checkdigit.dart';

/// An instance of the default implementation of the [Damm].
const damm = Damm();

const _table = [
  [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
  [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
  [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
  [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
  [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
  [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
  [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
  [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
  [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
  [2, 5, 8, 1, 4, 3, 6, 7, 9, 0],
];

/// A class that implements the Damm checksum formula.
class Damm extends CheckDigit {
  ///
  const Damm();

  static int _compute(String data) {
    // 1. Set up an interim digit and initialize it to 0.
    var interim = 0;

    // 2. Process the number digit by digit:
    // Use the number's digit as column index and the interim digit as row index,
    // take the table entry and replace the interim digit with it.
    for (var i = 0; i < data.length; i++) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      interim = _table[interim][digit];
    }

    return interim;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length < 2) {
      return false;
    }

    return _compute(data) == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.isEmpty) {
      throw ArgumentError('Must be not null or empty');
    }

    return _compute(data);
  }
}
