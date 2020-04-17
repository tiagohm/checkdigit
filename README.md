# Checksum

A set of checksum algorithms for data integrity validation.

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