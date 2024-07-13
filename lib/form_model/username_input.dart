import 'package:formz/formz.dart';

import './input_value.dart';

// Define input validation errors
enum UsernameError { empty, invalid }

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsernameError> {
  final inputValue = const InputValue('');

  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty == true) {
      return UsernameError.empty;
    }

    return null;
  }
}
