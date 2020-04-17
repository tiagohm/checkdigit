import 'package:checksum/checksum.dart';
import 'package:test/test.dart';

void main() {
  group('Luhn', () {
    test('Check Digit', () {
      expect(luhn.checkDigit('7992739871'), 3);
      expect(luhn.checkDigit('7992789891'), 0);
    });

    test('Is Valid', () {
      expect(luhn.validate('79927398713'), isTrue);
      expect(luhn.validate('79927898910'), isTrue);
    });

    test('Is Not Valid', () {
      expect(luhn.validate('79927398714'), isFalse);
    });

    test('Invalid Input', () {
      expect(() => luhn.validate('7992789891O'), throwsA(isA<ArgumentError>()));
      expect(() => luhn.checkDigit(''), throwsA(isA<ArgumentError>()));
      expect(() => luhn.checkDigit(null), throwsA(isA<ArgumentError>()));
      expect(luhn.validate(''), isFalse);
      expect(luhn.validate(null), isFalse);
      expect(luhn.validate('0'), isFalse);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 0; i < 1000; i++) {
        final n = i.toString().padLeft(3, '0');
        final cd = luhn.checkDigit(n);
        expect(luhn.validate('$n$cd'), isTrue);
      }
    });
  });

  group('Verhoeff', () {
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
  });

  group('Damm', () {
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
  });
}
