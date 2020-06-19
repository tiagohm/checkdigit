import 'package:checkdigit/src/ean.dart';
import 'package:test/test.dart';

void main() {
  group('UPC-A', () {
    test('Check Digit', () {
      expect(upcA.checkDigit('03600029145'), 2);
      expect(upcA.checkDigit('04210000526'), 4);
    });

    test('Is Valid', () {
      expect(upcA.validate('036000291452'), true);
      expect(upcA.validate('042100005264'), true);
    });
  });

  group('EAN-13', () {
    test('Check Digit', () {
      expect(ean13.checkDigit('400638133393'), 1);
    });

    test('Is Valid', () {
      expect(ean13.validate('4006381333931'), true);
    });
  });

  group('EAN-8', () {
    test('Check Digit', () {
      expect(ean8.checkDigit('7351353'), 7);
    });

    test('Is Valid', () {
      expect(ean8.validate('73513537'), true);
    });
  });
}
