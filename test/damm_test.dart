import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(damm.checkDigit('572'), 4);
  });

  test('Check Digit As String', () {
    expect(damm.checkDigitAsString('572'), '4');
  });

  test('Is Valid', () {
    expect(damm.validate('5724'), true);
  });

  test('Is Not Valid', () {
    expect(damm.validate('5720'), false);
  });

  test('Invalid Input', () {
    expect(() => damm.validate('572O'), throwsA(isA<ArgumentError>()));
    expect(() => damm.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(damm.validate(''), false);
    expect(damm.validate(null), false);
    expect(damm.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = i.toString().padLeft(3, '0');
      final cd = damm.checkDigit(n);
      expect(damm.validate('$n$cd'), true);
    }
  });
}
