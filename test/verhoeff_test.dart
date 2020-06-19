import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(verhoeff.checkDigit('236'), 3);
    expect(verhoeff.checkDigit('805'), 0);
  });

  test('Check Digit As String', () {
    expect(verhoeff.checkDigitAsString('236'), '3');
    expect(verhoeff.checkDigitAsString('805'), '0');
  });

  test('Is Valid', () {
    expect(verhoeff.validate('2363'), true);
    expect(verhoeff.validate('8050'), true);
  });

  test('Is Not Valid', () {
    expect(verhoeff.validate('2360'), false);
  });

  test('Invalid Input', () {
    expect(() => verhoeff.validate('805O'), throwsA(isA<ArgumentError>()));
    expect(() => verhoeff.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => verhoeff.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(verhoeff.validate(''), false);
    expect(verhoeff.validate(null), false);
    expect(verhoeff.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = i.toString().padLeft(3, '0');
      final cd = verhoeff.checkDigit(n);
      expect(verhoeff.validate('$n$cd'), true);
    }
  });
}
