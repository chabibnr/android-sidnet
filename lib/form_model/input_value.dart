class InputValue<T> {
  final T value;
  final bool hasError;

  const InputValue(this.value, [this.hasError = false]);

  InputValue<T> copyWith({T? value, bool? hasError}) {
    return InputValue(value ?? this.value, hasError ?? this.hasError);
  }
}
