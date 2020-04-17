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

  group('ISBN-10', () {
    test('Check Digit', () {
      expect(isbn10.checkDigit('030640615'), 2);
      expect(isbn10.checkDigit('999215810'), 7);
      expect(isbn10.checkDigit('997150210'), 0);
      expect(isbn10.checkDigit('972662905'), 5);
      expect(isbn10.checkDigit('853590277'), 5);
      expect(isbn10.checkDigit('068484328'), 5);
      expect(isbn10.checkDigit('080442957'), 10);
      expect(isbn10.checkDigit('085131041'), 9);
      expect(isbn10.checkDigit('094339604'), 2);
      expect(isbn10.checkDigit('097522980'), 10);
    });

    test('Is Valid', () {
      expect(isbn10.validate('0306406152'), isTrue);
      expect(isbn10.validate('9992158107'), isTrue);
      expect(isbn10.validate('9971502100'), isTrue);
      expect(isbn10.validate('9726629055'), isTrue);
      expect(isbn10.validate('8535902775'), isTrue);
      expect(isbn10.validate('0684843285'), isTrue);
      expect(isbn10.validate('080442957X'), isTrue);
      expect(isbn10.validate('0851310419'), isTrue);
      expect(isbn10.validate('0943396042'), isTrue);
      expect(isbn10.validate('097522980X'), isTrue);
    });

    test('Is Not Valid', () {
      expect(isbn10.validate('0306406150'), isFalse);
    });

    test('Invalid Input', () {
      expect(
          () => isbn10.validate('03064O6152'), throwsA(isA<ArgumentError>()));
      expect(() => isbn10.checkDigit(''), throwsA(isA<ArgumentError>()));
      expect(() => isbn10.checkDigit(null), throwsA(isA<ArgumentError>()));
      expect(isbn10.validate(''), isFalse);
      expect(isbn10.validate(null), isFalse);
      expect(isbn10.validate('0'), isFalse);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 100000000; i < 100000999; i++) {
        final n = i.toString();
        final cd = isbn10.checkDigit(n);
        expect(isbn10.validate('$n${cd == 10 ? 'X' : cd}'), isTrue);
      }
    });
  });

  group('ISBN-13', () {
    test('Check Digit', () {
      expect(isbn13.checkDigit('978030640615'), 7);
      expect(isbn13.checkDigit('978316148410'), 0);
    });

    test('Is Valid', () {
      expect(isbn13.validate('9780306406157'), isTrue);
      expect(isbn13.validate('9783161484100'), isTrue);
    });

    test('Is Not Valid', () {
      expect(isbn13.validate('9780306406156'), isFalse);
    });

    test('Invalid Input', () {
      expect(() => isbn13.validate('03066764O6152'),
          throwsA(isA<ArgumentError>()));
      expect(() => isbn13.checkDigit(''), throwsA(isA<ArgumentError>()));
      expect(() => isbn13.checkDigit(null), throwsA(isA<ArgumentError>()));
      expect(isbn13.validate(''), isFalse);
      expect(isbn13.validate(null), isFalse);
      expect(isbn13.validate('0'), isFalse);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 100000000000; i < 100000000999; i++) {
        final n = i.toString();
        final cd = isbn13.checkDigit(n);
        expect(isbn13.validate('$n$cd'), isTrue);
      }
    });
  });

  group('ISIN', () {
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
      expect(
          () => isin.validate('US0378331*05'), throwsA(isA<ArgumentError>()));
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
  });
}
