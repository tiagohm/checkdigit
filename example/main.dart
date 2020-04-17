import 'package:checksum/checksum.dart';

void main() {
  print(luhn.validate('79927398713'));
  print(luhn.checkDigit('7992739871') == 3);

  print(verhoeff.validate('2363'));
  print(verhoeff.checkDigit('236') == 3);
}
