import 'package:flutter/services.dart';

class Decimal extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextSelection textSelection = newValue.selection;

    String newString = newValue.text;

    if (newString.contains(',')) {
      newString = newString.replaceFirst(RegExp(r','), '.');
    }

    if (newString == '0' && oldValue.text.isEmpty ||
        newString == '.' && oldValue.text.isEmpty) {
      newString = '0.';
      textSelection = TextSelection.collapsed(offset: newString.length);
    } else if (newString == '0' && oldValue.text == '0.') {
      newString = '';
      textSelection = const TextSelection.collapsed(offset: 0);
    } else if (newString.contains('.')) {
      final countFirst = newString.split('.').first.length;

      if (countFirst == 1 && newString.length > 4) {
        newString = oldValue.text;
        textSelection = oldValue.selection;
      } else if (newString.length > 5) {
        newString = oldValue.text;
        textSelection = oldValue.selection;
      }
    } else if (newString.length == 2 &&
        !newString.contains('.') &&
        newString.length > oldValue.text.length) {
      newString = '$newString.';
      textSelection = TextSelection.collapsed(offset: newString.length);
    } else if (newString.length == 2 &&
        oldValue.text.contains('.') &&
        newString.length < oldValue.text.length) {
      newString = newString.substring(0, 1);
      textSelection = TextSelection.collapsed(offset: newString.length);
    }

    return TextEditingValue(
      text: newString,
      selection: textSelection,
    );
  }
}
