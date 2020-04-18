import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(verhoeff.checkDigit('236'), 3);
    expect(verhoeff.checkDigit('805'), 0);
  });

  test('Is Valid', () {
    expect(verhoeff.validate('2363'), isTrue);
    expect(verhoeff.validate('8050'), isTrue);
  });

  test('Is Not Valid', () {
    expect(verhoeff.validate('2360'), isFalse);
  });

  test('Invalid Input', () {
    expect(() => verhoeff.validate('805O'), throwsA(isA<ArgumentError>()));
    expect(() => verhoeff.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => verhoeff.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(verhoeff.validate(''), isFalse);
    expect(verhoeff.validate(null), isFalse);
    expect(verhoeff.validate('0'), isFalse);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = i.toString().padLeft(3, '0');
      final cd = verhoeff.checkDigit(n);
      expect(verhoeff.validate('$n$cd'), isTrue);
    }
  });
}
