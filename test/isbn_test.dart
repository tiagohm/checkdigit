import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
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
}
