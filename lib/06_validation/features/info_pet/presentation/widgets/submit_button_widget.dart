import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoPetScreenModel>(
      builder: (_, model, __) {
        return switch (model.buttonState) {
          ButtonState.disabled => const ElevatedButton(
              onPressed: null,
              child: Text('Отправить'),
            ),
          ButtonState.enable => ElevatedButton(
              onPressed: model.submitForm,
              child: const Text('Отправить'),
            ),
          ButtonState.sending => const ElevatedButton(
              onPressed: null,
              child: SizedBox.square(
                dimension: 24.0,
                child: CircularProgressIndicator(),
              ),
            ),
        };
      },
    );
  }
}
