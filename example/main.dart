import 'package:checksum/checksum.dart';

void main() {
  print(luhn.validate('79927398713'));
  print(luhn.checkDigit('7992739871') == 3);

  print(verhoeff.validate('2363'));
  print(verhoeff.checkDigit('236') == 3);

  print(damm.validate('5724'));
  print(damm.checkDigit('572') == 4);

  print(isbn13.validate('9783161484100'));
  print(isbn13.checkDigit('978316148410') == 0);

  print(isbn10.validate('080442957X'));
  print(isbn10.checkDigit('080442957') == 10);

  print(isin.validate('US0378331005'));
  print(isin.checkDigit('US037833100') == 5);
}
