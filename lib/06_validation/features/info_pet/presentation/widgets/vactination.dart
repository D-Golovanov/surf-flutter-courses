import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/string_constants.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class VactinationFormWidget extends StatelessWidget {
  const VactinationFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fm = context.read<FormModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          StringConstants.createVactination,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.33,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 24),
        VactinationCheckBox(
          title: StringConstants.labelRabies,
          inputModel: fm.rabies,
        ),
        VactinationCheckBox(
          title: StringConstants.labelCovid,
          inputModel: fm.covid,
        ),
        VactinationCheckBox(
          title: StringConstants.labelMalaria,
          inputModel: fm.malaria,
        )
      ],
    );
  }
}

class VactinationCheckBox extends StatefulWidget {
  final String title;
  final Input inputModel;

  const VactinationCheckBox({
    super.key,
    required this.title,
    required this.inputModel,
  });

  @override
  State<VactinationCheckBox> createState() => _VactinationCheckBoxState();
}

class _VactinationCheckBoxState extends State<VactinationCheckBox> {
  bool _isSelect = false;
  late FormModel fm;

  @override
  void initState() {
    fm = context.read<FormModel>();
    super.initState();
  }

  void _change() {
    _isSelect = !_isSelect;
    widget.inputModel.active = _isSelect;
    fm.validationForm();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<ButtonState>(
            valueListenable: fm.buttonState,
            builder: (_, state, __) {
              return GestureDetector(
                onTap: state == ButtonState.sending ? null : _change,
                child: Opacity(
                  opacity: state == ButtonState.sending ? .5 : 1,
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: _isSelect ? AppColors.red : AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: _isSelect
                            ? const Icon(
                                Icons.check_rounded,
                                size: 16,
                                color: Colors.white,
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        const SizedBox(height: 16),
        if (_isSelect)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: CustomTextFormFieldDate(
              modelValue: widget.inputModel,
              validator: Validator.date,
              label: StringConstants.labelLastDateVactination,
              readOnly: true,
            ),
          ),
      ],
    );
  }
}
