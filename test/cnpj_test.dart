import 'dart:math';

import 'package:checkdigit/checkdigit.dart';
import 'package:test/test.dart';

void main() {
  test('Check Digit', () {
    expect(cnpj.checkDigit('112223330001'), 81);
    expect(cnpj.checkDigit('194271610001'), 94);
    expect(cnpj.checkDigit('924491810001'), 56);
    expect(cnpj.checkDigit('361585420001'), 34);
    expect(cnpj.checkDigit('586015860001'), 20);
    expect(cnpj.checkDigit('798257370001'), 01);
  });

  test('Check Digit As String', () {
    expect(cnpj.checkDigitAsString('112223330001'), '81');
    expect(cnpj.checkDigitAsString('194271610001'), '94');
    expect(cnpj.checkDigitAsString('924491810001'), '56');
    expect(cnpj.checkDigitAsString('361585420001'), '34');
    expect(cnpj.checkDigitAsString('586015860001'), '20');
    expect(cnpj.checkDigitAsString('798257370001'), '01');
  });

  test('Is Valid', () {
    expect(cnpj.validate('11222333000181'), true);
    expect(cnpj.validate('19427161000194'), true);
    expect(cnpj.validate('92449181000156'), true);
    expect(cnpj.validate('36158542000134'), true);
    expect(cnpj.validate('58601586000120'), true);
    expect(cnpj.validate('79825737000101'), true);
  });

  test('Is Not Valid', () {
    expect(cnpj.validate('11222333000180'), false);
    expect(cnpj.validate('36158542000144'), false);
    expect(cnpj.validate('79825737000102'), false);
  });

  test('Invalid Input', () {
    expect(
        () => cnpj.validate('1122233300018O'), throwsA(isA<ArgumentError>()));
    expect(
        () => cnpj.validate('1122233300O180'), throwsA(isA<ArgumentError>()));
    expect(() => cnpj.checkDigit(''), throwsA(isA<ArgumentError>()));
    expect(cnpj.validate(''), false);
    expect(cnpj.validate(null), false);
    expect(cnpj.validate('0'), false);
  });

  test('Obtaining Check Digit & Validating', () {
    final random = Random();

    for (var i = 0; i < 1000; i++) {
      final n = '${random.nextInt(1 << 32)}'.padRight(12, '0');
      final cd = cnpj.checkDigitAsString(n);
      expect(cnpj.validate('$n$cd'), true);
    }
  });
}
