import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';

enum ButtonState { enable, disabled, sending }

class Input {
  bool active;
  String value;
  bool isError;
  bool hasFocus;

  Input(
      {this.active = false,
      this.value = '',
      this.isError = false,
      this.hasFocus = false});

  @override
  String toString() => '$active - $value - $isError';
}

class FormModel extends ChangeNotifier {
  final typePet = ValueNotifier<TypePet>(TypePet.dog);
  final buttonState = ValueNotifier<ButtonState>(ButtonState.disabled);

  Input name = Input();
  Input weigth = Input();
  Input email = Input();
  Input birthday = Input();

  Input rabies = Input();
  Input covid = Input();
  Input malaria = Input();

  void validationForm() {
    [name, weigth, email, birthday, rabies, covid, malaria]
            .where((element) => element.active)
            .every((el) => !el.isError && el.value.isNotEmpty)
        ? buttonState.value = ButtonState.enable
        : buttonState.value = ButtonState.disabled;
  }

  void submit() async {
    buttonState.value = ButtonState.sending;
    await Future.delayed(const Duration(milliseconds: 2000));
    buttonState.value = ButtonState.disabled;
  }
}
