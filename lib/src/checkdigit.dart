/// An abstract class for check digit algorithms implementation.
abstract class CheckDigit {
  ///
  const CheckDigit();

  /// Validates the [data] integrity.
  /// It assumes that the check digit is appended at end of [data].
  bool validate(String data);

  /// Computes the check digit from [data].
  int checkDigit(String data);
}
