import 'dart:io';
import 'package:lock_and_key/password_manager.dart';

void main(List<String> arguments) {
  print('🔐 Lock & Key - Password Utility');

  while (true) {
    print('\nChoose an option:');
    print('1. Generate Strong Password');
    print('2. Generate Intermediate Password');
    print('3. Generate Low Password');
    print('4. Validate Password Strength');
    print('5. Exit');

    stdout.write('Enter your choice (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        final strong = PasswordManager.generateStrongPassword();
        print('Strong Password: $strong');
        break;
      case '2':
        final mid = PasswordManager.generateIntermediatePassword();
        print('Intermediate Password: $mid');
        break;
      case '3':
        final low = PasswordManager.generateLowPassword();
        print('Low Password: $low');
        break;
      case '4':
        stdout.write('Enter password to validate: ');
        final input = stdin.readLineSync() ?? '';
        final strength = PasswordManager.validatePasswordStrength(input);
        print('Password Strength: $strength');
        break;
      case '5':
        print('👋 Goodbye!');
        exit(0);
      default:
        print('⚠️ Invalid choice. Try again.');
    }
  }
}
