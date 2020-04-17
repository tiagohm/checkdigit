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
  });
}
