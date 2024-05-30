import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class VactinationFormWidget extends StatefulWidget {
  const VactinationFormWidget({super.key});

  @override
  State<VactinationFormWidget> createState() => _VactinationFormWidgetState();
}

class _VactinationFormWidgetState extends State<VactinationFormWidget> {
  late InfoPetScreenModel formModel;

  @override
  void initState() {
    formModel = context.read<InfoPetScreenModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 24),
      const Text(
        'Сделаны прививки от:',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.33,
          color: AppColors.textDark,
        ),
      ),
      const SizedBox(height: 24),
      VactinationCheckBox(
        title: 'бешенства',
        inputModel: formModel.rabiesInputModel,
      ),
      VactinationCheckBox(
        title: 'ковида',
        inputModel: formModel.covidInputModel,
      ),
      VactinationCheckBox(
        title: 'малярии',
        inputModel: formModel.malariaInputModel,
      )
    ]);
  }
}

class VactinationCheckBox extends StatelessWidget {
  final String title;
  final VactinationInputModel inputModel;
  const VactinationCheckBox({
    super.key,
    required this.title,
    required this.inputModel,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoPetScreenModel>(
      builder: (_, formModel, __) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                formModel.change(inputModel);
                inputModel.selected
                    ? formModel.setButtonState(ButtonState.disabled)
                    : formModel.setButtonState(ButtonState.enable);
              },
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color:
                          inputModel.selected ? AppColors.red : AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: inputModel.selected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 16,
                            color: Colors.white,
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (inputModel.selected)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CustomTextFormField(
                  modelValue: inputModel,
                  validator: Validator.date,
                  vlaidationOnChange: true,
                  onTap: () => datePicker(
                    context: context,
                    controller: inputModel.controller,
                  ),
                  label: 'Дата последней прививки',
                  readOnly: true,
                ),
              ),
          ],
        );
      },
    );
  }
}
