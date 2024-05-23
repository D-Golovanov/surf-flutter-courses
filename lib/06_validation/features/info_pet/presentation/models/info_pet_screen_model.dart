import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';

enum ButtonState { enable, disabled, sending }

class InputModel {
  final TextEditingController value;
  String? error;
  InputModel({required this.value, this.error});
}

class InfoPetScreenModel extends ChangeNotifier {
  TypePet type = TypePet.dog;

  InputModel nameInputModel =
      InputModel(value: TextEditingController(), error: null);
  InputModel birthdayInputModel =
      InputModel(value: TextEditingController(), error: null);
  InputModel weigthInputModel =
      InputModel(value: TextEditingController(), error: null);
  InputModel emailInputModel =
      InputModel(value: TextEditingController(), error: null);

  InputModel rabiesInputModel =
      InputModel(value: TextEditingController(), error: null);
  InputModel covidInputModel =
      InputModel(value: TextEditingController(), error: null);
  InputModel malariaInputModel =
      InputModel(value: TextEditingController(), error: null);

  ButtonState _formState = ButtonState.disabled;

  ButtonState get formState => _formState;

  void validationForm() {
    [
      nameInputModel,
      birthdayInputModel,
      weigthInputModel,
      emailInputModel,
      rabiesInputModel,
      covidInputModel,
      malariaInputModel
    ].every((element) => element.error == null && element.value.text.isNotEmpty)
        ? _formState = ButtonState.enable
        : _formState = ButtonState.disabled;

    notifyListeners();
  }

  void setType(TypePet newType) {
    type = newType;
    notifyListeners();
  }

  @override
  String toString() =>
      '$type - ${nameInputModel.value.text} ${nameInputModel.error}';
}
