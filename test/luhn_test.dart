import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(luhn.checkDigit('7992739871'), 3);
    expect(luhn.checkDigit('7992789891'), 0);
  });

  test('Is Valid', () {
    expect(luhn.validate('79927398713'), true);
    expect(luhn.validate('79927898910'), true);
  });

  test('Is Not Valid', () {
    expect(luhn.validate('79927398714'), false);
  });

  test('Invalid Input', () {
    expect(() => luhn.validate('7992789891O'), throwsA(isA<ArgumentError>()));
    expect(() => luhn.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => luhn.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(luhn.validate(''), false);
    expect(luhn.validate(null), false);
    expect(luhn.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = i.toString().padLeft(3, '0');
      final cd = luhn.checkDigit(n);
      expect(luhn.validate('$n$cd'), true);
    }
  });
}
