import 'dart:math';

/// A class that handles password generation and validation.
class PasswordManager {
  static final Random _random = Random();

  // Character pools
  static const String _lowerCase = 'abcdefghijklmnopqrstuvwxyz';
  static const String _upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String _numbers = '0123456789';
  static const String _symbols = '!@#\$%^&*()-_=+[]{}|;:<>,.?/';

  /// Generates a strong password with:
  /// - At least 12 characters
  /// - Includes uppercase, lowercase, numbers, and symbols
  static String generateStrongPassword({int length = 16}) {
    return _generatePassword(
      length,
      [_lowerCase, _upperCase, _numbers, _symbols],
    );
  }

  /// Generates an intermediate password with:
  /// - At least 8 characters
  /// - Includes uppercase, lowercase, and numbers
  static String generateIntermediatePassword({int length = 12}) {
    return _generatePassword(
      length,
      [_lowerCase, _upperCase, _numbers],
    );
  }

  /// Generates a low-strength password with:
  /// - At least 6 characters
  /// - Includes only lowercase and numbers
  static String generateLowPassword({int length = 8}) {
    return _generatePassword(
      length,
      [_lowerCase, _numbers],
    );
  }

  /// Helper method to generate password based on selected character sets
  static String _generatePassword(int length, List<String> charSets) {
    final allChars = charSets.join();
    String password = '';
    for (int i = 0; i < length; i++) {
      password += allChars[_random.nextInt(allChars.length)];
    }
    return password;
  }

  /// Validates the strength of a password and returns the level.
  static String validatePasswordStrength(String password) {
    final hasLower = RegExp(r'[a-z]').hasMatch(password);
    final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);
    final hasSymbol = RegExp(r'[!@#\$%^&*()\-_=+\[\]{}|;:<>,.?/]').hasMatch(password);

    final length = password.length;

    if (length >= 12 && hasLower && hasUpper && hasNumber && hasSymbol) {
      return 'Strong';
    } else if (length >= 8 && hasLower && hasUpper && hasNumber) {
      return 'Intermediate';
    } else if (length >= 6 && hasLower && hasNumber) {
      return 'Low';
    } else {
      return 'Very Weak';
    }
  }
}
