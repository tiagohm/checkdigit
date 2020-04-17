abstract class Checksum {
  ///
  const Checksum();

  /// Validates the [data] integrity.
  /// It assumes that the check digit is appended at end of [data].
  bool validate(String data);

  /// Computes the check digit from [data].
  int checkDigit(String data);
}
