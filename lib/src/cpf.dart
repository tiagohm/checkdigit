import 'package:checkdigit/checkdigit.dart';

/// An instance of the default implementation of the [Cpf].
const cpf = Cpf();

/// A class that implements the CPF (Cadastro de Pessoas Físicas) check digit algorithm.
class Cpf extends Cda {
  ///
  const Cpf();

  int _compute(
    String data, {
    int factor,
  }) {
    var sum = 0;

    for (var i = 0; i < data.length; i++) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      sum += digit * (factor - i);
    }

    return sum;
  }

  @override
  bool validate(String data) {
    if (data == null || data.length != 11) {
      return false;
    }

    var sum = 0;

    for (var i = 9; i <= 10; i++) {
      final digit = data.codeUnitAt(i) - 48;

      if (digit < 0 || digit > 9) {
        throw ArgumentError('Digit at index $i must be a number');
      }

      sum = (sum * 10) + digit;
    }

    final dv = checkDigit(data.substring(0, 9));

    return dv == sum;
  }

  @override
  int checkDigit(String data) {
    if (data == null || data.length != 9) {
      throw ArgumentError('Must be not null and must contain 9 digits');
    }

    final sum1 = _compute(data, factor: 10);
    final r1 = sum1 % 11;
    final v1 = r1 == 0 || r1 == 1 ? 0 : (11 - r1);

    final sum2 = _compute(data, factor: 11) + v1 * 2;
    final r2 = sum2 % 11;
    final v2 = r2 == 0 || r2 == 1 ? 0 : (11 - r2);

    return v1 * 10 + v2;
  }
}
