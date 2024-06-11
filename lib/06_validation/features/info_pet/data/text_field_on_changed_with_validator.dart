import 'package:surf_flutter_courses_template/06_validation/core/string_constants.dart';

abstract class Validator {
  static String? email(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return StringConstants.emptyEmail;
      }
      if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$')
          .hasMatch(value)) {
        return StringConstants.incorrectEmail;
      }
    }
    return null;
  }

  static String? name(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return StringConstants.emptyName;
      }
      if (value.length < 3 || value.length >= 20) {
        return StringConstants.incorrectName;
      }
    }
    return null;
  }

  static String? weigth(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return StringConstants.emptyWeigth;
      }
      if (double.tryParse(value) == null || double.tryParse(value) is String) {
        return StringConstants.incorrectWeigth;
      } else {
        if (double.tryParse(value)! <= 0) {
          return StringConstants.incorrectWeigthMoreZero;
        }
      }
    }
    return null;
  }

  static String? date(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return StringConstants.emptyDate;
      }
    }
    return null;
  }
}
