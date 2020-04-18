import 'package:checkdigit/checkdigit.dart';

/// An instance of the default implementation of the [Verhoeff].
const verhoeff = Verhoeff();

// d(j,k)
//This table is based on multiplication in the dihedral group D5
// and is simply the Cayley table of the group. Note that this group is not commutative,
// that is, for some values of j and k, d(j,k) != d(k, j).
const _d = [
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
  [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
  [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
  [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
  [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
  [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
  [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
  [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
  [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
];

// inv(j)
// The inverse table inv represents the multiplicative inverse of a digit, that is,
// the value that satisfies d(j, inv(j)) = 0.
const _inv = [
  0,
  4,
  3,
  2,
  1,
  5,
  6,
  7,
  8,
  9,
];

// p(pos,num)
// The permutation table p applies a permutation to each digit based on its position
// in the number. This is actually a single permutation (1 5 8 9 4 2 7 0)(3 6)
// applied iteratively; i.e. p(i+j,n) = p(i, p(j,n)).
const _p = [
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
  [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
  [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
  [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
  [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
  [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
  [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
  [7, 0, 4, 6, 9, 1, 3, 2, 5, 8],
];

/// A class that implements the Verhoeff checksum formula.
class Verhoeff extends Cda {
  ///
  const Verhoeff();

  static int _compute(
    String data, {
    bool hasCheckDigit = true,
  }) {
    final initialIndex = hasCheckDigit ? 0 : 1;

    // 2. Initialize the checksum c to zero.
    var c = 0;

    // 1. Create an array n out of the individual digits of the number,
    // taken from right to left.
    for (var k = data.length - 1, i = initialIndex; k >= 0; k--, i++) {
      final digit = data.codeUnitAt(k) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $k must be a number');
      }

      // 3. For each index i of the array n, starting at zero,
      // replace c with d(c, p(i mod 8, ni)).
      c = _d[c][_p[i % 8][digit]];
    }

    return c;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length < 2) {
      return false;
    }

    // The original number is valid if and only if c = 0.
    return _compute(data) == 0;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.isEmpty) {
      throw ArgumentError('Must be not null or empty');
    }

    final c = _compute(data, hasCheckDigit: false);
    return _inv[c];
  }
}
