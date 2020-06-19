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

    test('Check Digit As String', () {
      expect(isbn10.checkDigitAsString('030640615'), '2');
      expect(isbn10.checkDigitAsString('999215810'), '7');
      expect(isbn10.checkDigitAsString('997150210'), '0');
      expect(isbn10.checkDigitAsString('972662905'), '5');
      expect(isbn10.checkDigitAsString('853590277'), '5');
      expect(isbn10.checkDigitAsString('068484328'), '5');
      expect(isbn10.checkDigitAsString('080442957'), 'X');
      expect(isbn10.checkDigitAsString('085131041'), '9');
      expect(isbn10.checkDigitAsString('094339604'), '2');
      expect(isbn10.checkDigitAsString('097522980'), 'X');
    });

    test('Is Valid', () {
      expect(isbn10.validate('0306406152'), true);
      expect(isbn10.validate('9992158107'), true);
      expect(isbn10.validate('9971502100'), true);
      expect(isbn10.validate('9726629055'), true);
      expect(isbn10.validate('8535902775'), true);
      expect(isbn10.validate('0684843285'), true);
      expect(isbn10.validate('080442957X'), true);
      expect(isbn10.validate('0851310419'), true);
      expect(isbn10.validate('0943396042'), true);
      expect(isbn10.validate('097522980X'), true);
    });

    test('Is Not Valid', () {
      expect(isbn10.validate('0306406150'), false);
    });

    test('Invalid Input', () {
      expect(
          () => isbn10.validate('03064O6152'), throwsA(isA<ArgumentError>()));
      expect(() => isbn10.checkDigit(''), throwsA(isA<ArgumentError>()));
      expect(() => isbn10.checkDigit(null), throwsA(isA<ArgumentError>()));
      expect(isbn10.validate(''), false);
      expect(isbn10.validate(null), false);
      expect(isbn10.validate('0'), false);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 100000000; i < 100000999; i++) {
        final n = i.toString();
        final cd = isbn10.checkDigit(n);
        expect(isbn10.validate('$n${cd == 10 ? 'X' : cd}'), true);
      }
    });
  });

  group('ISBN-13', () {
    test('Check Digit', () {
      expect(isbn13.checkDigit('978030640615'), 7);
      expect(isbn13.checkDigit('978316148410'), 0);
    });

    test('Check Digit As String', () {
      expect(isbn13.checkDigitAsString('978030640615'), '7');
      expect(isbn13.checkDigitAsString('978316148410'), '0');
    });

    test('Is Valid', () {
      expect(isbn13.validate('9780306406157'), true);
      expect(isbn13.validate('9783161484100'), true);
    });

    test('Is Not Valid', () {
      expect(isbn13.validate('9780306406156'), false);
    });

    test('Invalid Input', () {
      expect(() => isbn13.validate('03066764O6152'),
          throwsA(isA<ArgumentError>()));
      expect(() => isbn13.checkDigit(''), throwsA(isA<ArgumentError>()));
      expect(() => isbn13.checkDigit(null), throwsA(isA<ArgumentError>()));
      expect(isbn13.validate(''), false);
      expect(isbn13.validate(null), false);
      expect(isbn13.validate('0'), false);
    });

    test('Obtaining Check Digit & Validating', () {
      for (var i = 100000000000; i < 100000000999; i++) {
        final n = i.toString();
        final cd = isbn13.checkDigit(n);
        expect(isbn13.validate('$n$cd'), true);
      }
    });
  });
}
