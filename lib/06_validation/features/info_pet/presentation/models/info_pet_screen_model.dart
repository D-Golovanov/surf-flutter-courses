import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';

enum ButtonState { enable, disabled, sending }

class InputModel {
  final TextEditingController controller;
  String? error;
  InputModel({required this.controller, this.error});
}

class VactinationInputModel extends InputModel {
  bool selected;
  VactinationInputModel({
    required this.selected,
    required super.controller,
    super.error,
  });
}

class InfoPetScreenModel extends ChangeNotifier {
  TypePet type = TypePet.dog;

  InputModel nameInputModel =
      InputModel(controller: TextEditingController(), error: null);
  InputModel birthdayInputModel =
      InputModel(controller: TextEditingController(), error: null);
  InputModel weigthInputModel =
      InputModel(controller: TextEditingController(), error: null);
  InputModel emailInputModel =
      InputModel(controller: TextEditingController(), error: null);

  VactinationInputModel rabiesInputModel = VactinationInputModel(
    controller: TextEditingController(),
    error: null,
    selected: false,
  );
  VactinationInputModel covidInputModel = VactinationInputModel(
    controller: TextEditingController(),
    error: null,
    selected: false,
  );
  VactinationInputModel malariaInputModel = VactinationInputModel(
    controller: TextEditingController(),
    error: null,
    selected: false,
  );

  ButtonState _buttonState = ButtonState.disabled;

  ButtonState get buttonState => _buttonState;
  void setButtonState(ButtonState buttonState) {
    _buttonState = buttonState;
    notifyListeners();
  }

  final List<InputModel> _listInputsForm = [];

  void addInputForm(InputModel inputModel) => _listInputsForm.add(inputModel);
  void removeInputForm(InputModel inputModel) {
    inputModel.controller.text = '';
    inputModel.error = null;
    _listInputsForm.remove(inputModel);
  }

  void validationForm() {
    print(_listInputsForm.length);
    if (_listInputsForm.isNotEmpty) {
      _listInputsForm.every((element) =>
              element.error == null && element.controller.text.isNotEmpty)
          ? _buttonState = ButtonState.enable
          : _buttonState = ButtonState.disabled;

      notifyListeners();
    }
  }

  void setType(TypePet newType) {
    type = newType;
    validationForm();
    notifyListeners();
  }

  void change(VactinationInputModel vactinationInputModel) {
    vactinationInputModel.selected = !vactinationInputModel.selected;
    validationForm();
    notifyListeners();
  }

  Future<void> submitForm() async {
    _buttonState = ButtonState.sending;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 2000));
    _buttonState = ButtonState.enable;
    // cleanForm();
    notifyListeners();
  }

  void cleanForm() {
    nameInputModel.controller.text = '';
    nameInputModel.error = null;
    validationForm();
  }

  @override
  String toString() => '$type - ${nameInputModel.controller.text}';
}
