import 'checkdigit.dart';

/// An instance of the default implementation of the [Cnpj].
const cnpj = Cnpj();

/// A class that implements the CNPJ (Cadastro Nacional da Pessoa Jurídica)
/// check digit algorithm.
class Cnpj extends CheckDigit<int> {
  ///
  const Cnpj();

  static const _multiplier1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  static const _multiplier2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

  int _compute(
    String data,
    List<int> multiplier,
  ) {
    var sum = 0;

    for (var i = 0; i < data.length; i++) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      sum += digit * multiplier[i];
    }

    return sum;
  }

  @override
  bool validate(String? data) {
    if (data == null || data.length != 14) {
      return false;
    }

    final dv = int.tryParse(data.substring(12, 14));

    if (dv == null) {
      throw ArgumentError('Invalid check digit');
    }

    return dv == checkDigit(data.substring(0, 12));
  }

  @override
  int checkDigit(String data) {
    if (data.length != 12) {
      throw ArgumentError('Must not be null and must contain 12 digits');
    }

    final sum1 = _compute(data, _multiplier1);
    final r1 = sum1 % 11;
    final v1 = r1 < 2 ? 0 : (11 - r1);

    final sum2 = _compute(data, _multiplier2) + (v1 * 2);
    final r2 = sum2 % 11;
    final v2 = r2 < 2 ? 0 : (11 - r2);

    return (v1 * 10) + v2;
  }

  @override
  String checkDigitAsString(String data) {
    return '${checkDigit(data)}'.padLeft(2, '0');
  }
}
