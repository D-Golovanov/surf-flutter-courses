import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class TypePetRowButtonsWidget extends StatelessWidget {
  const TypePetRowButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FormModel fm = context.read<FormModel>();

    return ValueListenableBuilder<ButtonState>(
      valueListenable: fm.buttonState,
      builder: (_, buttonState, __) {
        return ValueListenableBuilder<TypePet>(
          valueListenable: fm.typePet,
          builder: (_, state, __) {
            return Opacity(
              opacity: buttonState == ButtonState.sending ? .5 : 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...TypePet.values.map(
                    (petItem) => GestureDetector(
                      onTap: buttonState == ButtonState.sending
                          ? null
                          : () {
                              fm.typePet.value = petItem;
                              fm.validationForm();
                            },
                      child: PetButton(
                        pet: petItem,
                        isActive: state == petItem,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
