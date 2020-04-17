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
      expect(verhoeff.validate(''), isFalse);
      expect(verhoeff.validate(null), isFalse);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 0; i < 1000; i++) {
        final n = i.toString().padLeft(3, '0');
        final cd = verhoeff.checkDigit(n);
        expect(verhoeff.validate('$n$cd'), isTrue);
      }
    });
  });
}
