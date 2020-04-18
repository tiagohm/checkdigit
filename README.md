# Checksum

A set of check digit algorithms used for error detection on identification numbers.

## Algorithms

### [Luhn](https://en.wikipedia.org/wiki/Luhn_algorithm)

```dart
bool isValid = luhn.validate('79927398713');
int checkDigit = luhn.checkDigit('7992739871');
```

### [Verhoeff](https://en.wikipedia.org/wiki/Verhoeff_algorithm)

```dart
bool isValid = verhoeff.validate('2363');
int checkDigit = verhoeff.checkDigit('236');
```

### [Damm](https://en.wikipedia.org/wiki/Damm_algorithm)

```dart
bool isValid = damm.validate('5724');
int checkDigit = damm.checkDigit('572');
```

### [ISBN](https://en.wikipedia.org/wiki/International_Standard_Book_Number#Check_digits)

```dart
bool isValid = isbn10.validate('080442957X');
int checkDigit = isbn10.checkDigit('080442957');

bool isValid = isbn13.validate('9783161484100');
int checkDigit = isbn13.checkDigit('978316148410');
```

### [ISIN](https://www.isin.org/education/)

```dart
bool isValid = isin.validate('US0378331005');
int checkDigit = isin.checkDigit('US037833100');
```

### [CPF](https://pt.wikipedia.org/wiki/Cadastro_de_pessoas_f%C3%ADsicas)

```dart
bool isValid = cpf.validate('11144477735');
int checkDigit = cpf.checkDigit('111444777');
```