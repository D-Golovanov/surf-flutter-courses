import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';

class VactinationFormModel extends ChangeNotifier {
  bool _rabies = false;
  String _rabiesDate = '';
  bool _covid = false;
  String _covidDate = '';
  bool _malaria = false;
  String _malariaDate = '';

  bool get rabies => _rabies;
  String get rabiesDate => _rabiesDate;
  bool get covid => _covid;
  String get covidDate => _covidDate;
  bool get malaria => _malaria;
  String get malariaDate => _malariaDate;

  void setRabies(bool value) {
    _rabies = value;
    notifyListeners();
  }

  void setRabiesDate(String value) {
    _rabiesDate = value;
    validation();
    notifyListeners();
  }

  void setCovid(bool value) {
    _covid = value;
    validation();
    notifyListeners();
  }

  void setCovidDate(String value) {
    _covidDate = value;
    validation();
    notifyListeners();
  }

  void setMalaria(bool value) {
    _malaria = value;
    validation();
    notifyListeners();
  }

  void setMalariaDate(String value) {
    _malariaDate = value;
    validation();
    notifyListeners();
  }

  bool validation() {
    final checkBoxVactination = [_rabies, _covid, _malaria];

    if (checkBoxVactination.every((e) => e == false)) {
      return true;
    } else {
      final compareField = [_rabiesDate, _covidDate, _malariaDate];

      for (int item = 0; item < checkBoxVactination.length; item++) {
        if (checkBoxVactination[item]) {
          if (Validator.date(compareField[item]) != null) {
            return false;
          }
        }
      }
      return true;
    }
  }
}
