# Checkdigit

[![Star on GitHub](https://img.shields.io/github/stars/tiagohm/checkdigit.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/tiagohm/checkdigit)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

A set of check digit algorithms used for error detection on identification numbers.

## Installation

In `pubspec.yaml` add the following dependency:

```yaml
dependencies:
  checkdigit: ^0.2.0
```

## Algorithms

### [Luhn](https://en.wikipedia.org/wiki/Luhn_algorithm)

```dart
bool isValid = luhn.validate('79927398713');
int checkDigit = luhn.checkDigit('7992739871');
String checkDigitAsString = luhn.checkDigitAsString('7992739871');
```

### [Verhoeff](https://en.wikipedia.org/wiki/Verhoeff_algorithm)

```dart
bool isValid = verhoeff.validate('2363');
int checkDigit = verhoeff.checkDigit('236');
String checkDigitAsString = verhoeff.checkDigitAsString('236');
```

### [Damm](https://en.wikipedia.org/wiki/Damm_algorithm)

```dart
bool isValid = damm.validate('5724');
int checkDigit = damm.checkDigit('572');
String checkDigitAsString = damm.checkDigitAsString('572');
```

### [ISBN](https://en.wikipedia.org/wiki/International_Standard_Book_Number#Check_digits)

```dart
// ISBN-10.
bool isValid = isbn10.validate('080442957X');
int checkDigit = isbn10.checkDigit('080442957');
String checkDigitAsString = isbn10.checkDigitAsString('080442957');
// ISBN-13.
bool isValid = isbn13.validate('9783161484100');
int checkDigit = isbn13.checkDigit('978316148410');
String checkDigitAsString = isbn13.checkDigitAsString('978316148410');
```

### [ISIN](https://www.isin.org/education/)

```dart
bool isValid = isin.validate('US0378331005');
int checkDigit = isin.checkDigit('US037833100');
String checkDigitAsString = isin.checkDigitAsString('US037833100');
```

### [CPF](https://pt.wikipedia.org/wiki/Cadastro_de_pessoas_f%C3%ADsicas)

```dart
bool isValid = cpf.validate('11144477735');
int checkDigit = cpf.checkDigit('111444777');
String checkDigitAsString = cpf.checkDigitAsString('111444777');
```

### [IBAN](https://en.wikipedia.org/wiki/International_Bank_Account_Number)

```dart
bool isValid = iban.validate('GB82WEST12345698765432');
int checkDigit = iban.checkDigit('GB00WEST12345698765432');
String checkDigitAsString = iban.checkDigitAsString('GB00WEST12345698765432');
```

### [CNPJ](https://pt.wikipedia.org/wiki/Cadastro_Nacional_da_Pessoa_Jur%C3%ADdica)

```dart
bool isValid = cnpj.validate('11222333000181');
int checkDigit = cnpj.checkDigit('112223330001');
String checkDigitAsString = cnpj.checkDigitAsString('112223330001');
```

### [EAN-X](https://en.wikipedia.org/wiki/International_Article_Number)

```dart
// EAN-13.
bool isValid = ean13.validate('4006381333931');
int checkDigit = ean13.checkDigit('400638133393');
String checkDigitAsString = ean13.checkDigitAsString('400638133393');
// UPC-A.
bool isValid = upcA.validate('036000291452');
int checkDigit = upcA.checkDigit('03600029145');
String checkDigitAsString = upcA.checkDigitAsString('03600029145');
// EAN-8.
bool isValid = ean8.validate('73513537');
int checkDigit = ean8.checkDigit('7351353');
String checkDigitAsString = ean8.checkDigitAsString('7351353');
```