import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/view/info_pet_screen.dart';

class FormModel extends ChangeNotifier {
  TypePet type = TypePet.dog;

  String name = '';
  String birthday = '';
  String weigth = '';
  String email = '';

  bool selectRabies = false;
  String? rabies;
  bool selectCovid = false;
  String? covid;
  bool selectMalaria = false;
  String? malaria;

  ButtonState buttonState = ButtonState.disabled;

  void setType(TypePet newType) {
    type = newType;
    notifyListeners();
  }

  void setName(String value) {
    name = value;
    validation();
    notifyListeners();
  }

  void setBirthday(String value) {
    birthday = value;
    validation();
    notifyListeners();
  }

  void setWeigth(String value) {
    weigth = value;
    validation();
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    validation();
    notifyListeners();
  }

  ButtonState get getButtonState => buttonState;

  void setButtonState(ButtonState state) {
    buttonState = state;
    notifyListeners();
  }

  bool validation() {
    return [
      Validator.name(name),
      Validator.date(birthday),
      Validator.weigth(weigth),
      Validator.email(email)
    ].every((e) => e == null);
  }
  /*
  void validation() {
    final mainFieldValid = [
      Validator.name(name),
      Validator.date(birthday),
      Validator.weigth(weigth),
      Validator.email(email)
    ].every((e) => e == null);
    if (mainFieldValid) {
      setButtonState(ButtonState.enable);
    } else {
      setButtonState(ButtonState.disabled);
    }
    print(
        'name: $name, birthday: $birthday, weigth: $weigth, email: $birthday \n$mainFieldValid');
  }
  */
}
