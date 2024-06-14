import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/string_constants.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FormModel fm = context.read<FormModel>();

    return ValueListenableBuilder<ButtonState>(
      valueListenable: fm.buttonState,
      builder: (_, state, __) => switch (state) {
        ButtonState.disabled => const ElevatedButton(
            onPressed: null,
            child: Text(StringConstants.buttonSubmit),
          ),
        ButtonState.enable => ElevatedButton(
            onPressed: fm.submit,
            child: const Text(StringConstants.buttonSubmit),
          ),
        ButtonState.sending => const ElevatedButton(
            onPressed: null,
            child: SizedBox.square(
              dimension: 24.0,
              child: CircularProgressIndicator(),
            ),
          ),
      },
    );
  }
}
