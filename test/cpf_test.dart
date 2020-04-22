import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(cpf.checkDigit('111444777'), 35);
    expect(cpf.checkDigit('366363840'), 50);
    expect(cpf.checkDigit('454850530'), 09);
    expect(cpf.checkDigit('830004230'), 01);
  });

  test('Is Valid', () {
    expect(cpf.validate('11144477735'), true);
    expect(cpf.validate('36636384050'), true);
    expect(cpf.validate('45485053009'), true);
  });

  test('Is Not Valid', () {
    expect(cpf.validate('11144477736'), false);
    expect(cpf.validate('36636384051'), false);
    expect(cpf.validate('45485053000'), false);
  });

  test('Invalid Input', () {
    expect(() => cpf.validate('36636384O51'), throwsA(isA<ArgumentError>()));
    expect(() => cpf.validate('4548505300O'), throwsA(isA<ArgumentError>()));
    expect(() => cpf.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => cpf.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(cpf.validate(''), false);
    expect(cpf.validate(null), false);
    expect(cpf.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = '111111${i.toString().padLeft(3, '0')}';
      final cd = cpf.checkDigit(n).toString().padLeft(2, '0');
      expect(cpf.validate('$n$cd'), true);
    }
  });
}
