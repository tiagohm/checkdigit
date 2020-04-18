import 'package:checksum/checksum.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(cpf.checkDigit('111444777'), 35);
    expect(cpf.checkDigit('366363840'), 50);
    expect(cpf.checkDigit('454850530'), 09);
    expect(cpf.checkDigit('830004230'), 01);
  });

  test('Is Valid', () {
    expect(cpf.validate('11144477735'), isTrue);
    expect(cpf.validate('36636384050'), isTrue);
    expect(cpf.validate('45485053009'), isTrue);
  });

  test('Is Not Valid', () {
    expect(cpf.validate('11144477736'), isFalse);
    expect(cpf.validate('36636384051'), isFalse);
    expect(cpf.validate('45485053000'), isFalse);
  });

  test('Invalid Input', () {
    expect(() => cpf.validate('36636384O51'), throwsA(isA<ArgumentError>()));
    expect(() => cpf.validate('4548505300O'), throwsA(isA<ArgumentError>()));
    expect(() => cpf.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(() => cpf.checkDigit(null), throwsA(isA<ArgumentError>()));
    expect(cpf.validate(''), isFalse);
    expect(cpf.validate(null), isFalse);
    expect(cpf.validate('0'), isFalse);
  });

  test('Obtaining Check Digit & Validating', () {
    for (var i = 0; i < 1000; i++) {
      final n = '111111${i.toString().padLeft(3, '0')}';
      final cd = cpf.checkDigit(n).toString().padLeft(2, '0');
      expect(cpf.validate('$n$cd'), isTrue);
    }
  });
}
