import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/form_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/vactination_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class VactinationFormWidget extends StatefulWidget {
  //final VactinationFormModel vactinationFormModel;
  const VactinationFormWidget({
    super.key, //required this.vactinationFormModel
  });

  @override
  State<VactinationFormWidget> createState() => _VactinationFormWidgetState();
}

class _VactinationFormWidgetState extends State<VactinationFormWidget> {
  final _rabiesController = TextEditingController();
  final _covidController = TextEditingController();
  final _malariaController = TextEditingController();

  @override
  void initState() {
    /*
    _rabiesController.addListener(() =>
        widget.vactinationFormModel.setRabiesDate(_rabiesController.text));
    _covidController.addListener(
        () => widget.vactinationFormModel.setRabiesDate(_covidController.text));
    _malariaController.addListener(() =>
        widget.vactinationFormModel.setRabiesDate(_malariaController.text));
*/
    super.initState();
  }

  @override
  void dispose() {
    _rabiesController.dispose();
    _covidController.dispose();
    _malariaController.dispose();

    super.dispose();
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
        model: vactinationWidgetList[0],
        controller: _rabiesController,
      ),
      VactinationCheckBox(
        model: vactinationWidgetList[1],
        controller: _covidController,
      ),
      VactinationCheckBox(
        model: vactinationWidgetList[2],
        controller: _malariaController,
      )
    ]);
  }
}

class VactinationCheckBox extends StatelessWidget {
  final VactinationModel model;
  final TextEditingController controller;
  const VactinationCheckBox(
      {super.key, required this.model, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: model,
      builder: (context, child) {
        return Column(
          children: [
            GestureDetector(
              onTap: model.change,
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: model.isSelect ? AppColors.red : AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: model.isSelect
                        ? const Icon(
                            Icons.check_rounded,
                            size: 16,
                            color: Colors.white,
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    model.title,
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
            if (model.isSelect)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: const SizedBox(height: 16.0),
                // CustomTextFormField(
                //   // controller: controller,
                //   validator: Validator.date,
                //   vlaidationOnChange: true,
                //   onTap: () => datePicker(
                //     context: context,
                //     controller: controller,
                //   ),
                //   label: 'Дата последней прививки',
                //   readOnly: true,
                // ),
              ),
          ],
        );
      },
    );
  }
}
