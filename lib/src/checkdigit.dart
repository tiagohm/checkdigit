/// An abstract class for check digit algorithms implementation.
abstract class CheckDigit<T> {
  ///
  const CheckDigit();

  /// Validates the [data] integrity.
  /// It assumes that the check digit is appended at end of [data].
  bool validate(String data);

  /// Computes the check digit from [data].
  T checkDigit(String data);

  /// Computes the check digit from [data] as [String].
  String checkDigitAsString(String data);
}
