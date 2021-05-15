import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(iban.checkDigit('GB82WEST12345698765432'), 82);
    expect(iban.checkDigit('GB00WEST12345698765432'), 82);
  });

  test('Check Digit As String', () {
    expect(iban.checkDigitAsString('GB82WEST12345698765432'), '82');
    expect(iban.checkDigitAsString('GB00WEST12345698765432'), '82');
  });

  test('Is Valid', () {
    expect(iban.validate('GB82WEST12345698765432'), true);
  });

  test('Is Not Valid', () {
    expect(iban.validate('GB82WEST1234569876543'), false);
    expect(iban.validate('GB81WEST12345698765432'), false);
  });

  test('Invalid Input', () {
    expect(() => iban.validate('US0378331*05'), throwsA(isA<ArgumentError>()));
    expect(() => iban.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(iban.validate('XX00'), false);
    expect(iban.validate(''), false);
    expect(iban.validate(null), false);
    expect(iban.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 999; i++) {
      final bban = i.toString().padLeft(3, '0');
      final n = 'XX00$bban';
      final cd = iban.checkDigitAsString(n);
      expect(iban.validate('XX$cd$bban'), true);
    }
  });
}
