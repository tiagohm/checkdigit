import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(isin.checkDigit('US037833100'), 5);
  });

  test('Is Valid', () {
    expect(isin.validate('US0378331005'), isTrue);
  });

  test('Is Not Valid', () {
    expect(isin.validate('US0378331004'), isFalse);
  });

  test('Invalid Input', () {
    expect(() => isin.validate('US0378331*05'), throwsA(isA<ArgumentError>()));
    expect(() => isin.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => isin.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(isin.validate(''), isFalse);
    expect(isin.validate(null), isFalse);
    expect(isin.validate('0'), isFalse);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 999; i++) {
      final n = 'US${i.toString().padLeft(3, '0')}';
      final cd = isin.checkDigit(n);
      expect(isin.validate('$n$cd'), isTrue);
    }
  });
}
