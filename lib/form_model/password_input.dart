import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty }

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    return value.isNotEmpty == true ? null : PasswordError.empty;
  }
}
