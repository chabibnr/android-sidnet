import './input_value.dart';
import 'package:formz/formz.dart';

// Define input validation errors
enum TextInputError { empty, invalid }

// Extend FormzInput and provide the input type and error type.
class TextInput extends FormzInput<String, TextInputError> {
  final inputValue = const InputValue('');

  // Call super.pure to represent an unmodified form input.
  const TextInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const TextInput.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  TextInputError? validator(String value) {
    if (value.isEmpty == true) {
      return TextInputError.empty;
    }

    return null;
  }
}
