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