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
bool isValid = luhn.validate('2363');
int checkDigit = luhn.checkDigit('236');
```