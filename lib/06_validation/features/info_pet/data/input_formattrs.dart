import 'package:flutter/services.dart';

class Decimal extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    TextSelection textSelection = newValue.selection;

    if (newValue.text.isEmpty) {
      return newValue;
    }

    // final regExp = RegExp(r'^\d*[\.,]?\d{0,2}$');
    final regExp = RegExp(r'^(([1-9]\d*)|0?)[\.,]?\d{0,2}$');

    String newString = regExp.stringMatch(newValue.text) ?? '';
    if (newString.isEmpty) {
      return oldValue;
    }

    if (newString.contains(',')) {
      newString = newString.replaceFirst(RegExp(r','), '.');
    }

    return TextEditingValue(
      text: newString,
      selection: textSelection,
    );
  }
}

class Email extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final regExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    String newString = regExp.stringMatch(newValue.text) ?? '';

    // if (regExp.stringMatch(newValue.text)) {
    //   return newValue;
    // } else {
    //   return oldValue;
    // }
    return newValue;
  }
}
