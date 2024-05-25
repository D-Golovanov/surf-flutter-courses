import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';

import 'widgets.dart';

class TypePetRowButtonsWidget extends StatelessWidget {
  const TypePetRowButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoPetScreenModel>(
      builder: (context, model, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...TypePet.values.map(
              (petItem) => GestureDetector(
                onTap: () => model.setType(petItem),
                child: PetButton(
                  pet: petItem,
                  isActive: model.type.title == petItem.title,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
