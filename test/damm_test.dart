import 'package:checksum/checksum.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(damm.checkDigit('572'), 4);
  });

  test('Is Valid', () {
    expect(damm.validate('5724'), isTrue);
  });

  test('Is Not Valid', () {
    expect(damm.validate('5720'), isFalse);
  });

  test('Invalid Input', () {
    expect(() => damm.validate('572O'), throwsA(isA<ArgumentError>()));
    expect(() => damm.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => damm.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(damm.validate(''), isFalse);
    expect(damm.validate(null), isFalse);
    expect(damm.validate('0'), isFalse);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = i.toString().padLeft(3, '0');
      final cd = damm.checkDigit(n);
      expect(damm.validate('$n$cd'), isTrue);
    }
  });
}
