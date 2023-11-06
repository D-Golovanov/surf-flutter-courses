/// sealed class for custom text field
///
/// Has state: EmptyState, ErrorState(String), ValidState
sealed class TextFormFieldState {}

class EmptyState extends TextFormFieldState {}

class ErrorState extends TextFormFieldState {
  final String errorText;

  ErrorState(this.errorText);
}

class ValidState extends TextFormFieldState {}
