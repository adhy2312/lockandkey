import 'dart:math';

class PasswordManager {
  
  bool validatePasswordStrength(String password) {
    if (password.length < 8) return false;
    if (!RegExp(r'[A-Z]').hasMatch(password)) return false; 
    if (!RegExp(r'[a-z]').hasMatch(password)) return false; 
    if (!RegExp(r'[0-9]').hasMatch(password)) return false; 
    if (!RegExp(r'[\W_]').hasMatch(password)) return false; 
    return true;
  }

  
  String generatePassword(String level) {
    switch (level.toLowerCase()) {
      case 'strong':
        return _generateRandomPassword(16, true, true, true, true);
      case 'intermediate':
        return _generateRandomPassword(12, true, true, true, false);
      case 'low':
        return _generateRandomPassword(8, true, true, false, false);
      default:
        throw ArgumentError('Invalid level. Choose from "strong", "intermediate", or "low".');
    }
  }

  
  String _generateRandomPassword(int length, bool useUppercase, bool useLowercase, bool useNumbers, bool useSpecialChars) {
    const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String specialChars = '!@#\$%^&*()-_=+[]{}|;:",.<>?';

    String chars = '';
    if (useUppercase) chars += uppercaseLetters;
    if (useLowercase) chars += lowercaseLetters;
    if (useNumbers) chars += numbers;
    if (useSpecialChars) chars += specialChars;

    Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }
}

void main() {
  PasswordManager pm = PasswordManager();

  
  print(pm.validatePasswordStrength('A!b2cdef')); 
  print(pm.validatePasswordStrength('abcdefg'));  

  // Generate passwords
  print('Strong password: ${pm.generatePassword('strong')}');
  print('Intermediate password: ${pm.generatePassword('intermediate')}');
  print('Low password: ${pm.generatePassword('low')}');
}
