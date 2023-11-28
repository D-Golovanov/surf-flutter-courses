import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/custom_text_form_field.dart';

class Vactination extends StatefulWidget {
  const Vactination({super.key});

  @override
  State<Vactination> createState() => _VactinationState();
}

class _VactinationState extends State<Vactination> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          model: VactinationCheckBoxModel(title: 'бешенства'),
        ),
        VactinationCheckBox(
          model: VactinationCheckBoxModel(title: 'ковида'),
        ),
        VactinationCheckBox(
          model: VactinationCheckBoxModel(title: 'малярии'),
        ),
      ],
    );
  }
}

class VactinationCheckBox extends StatefulWidget {
  final VactinationCheckBoxModel model;
  const VactinationCheckBox({super.key, required this.model});

  @override
  State<VactinationCheckBox> createState() => _VactinationCheckBoxState();
}

class _VactinationCheckBoxState extends State<VactinationCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.model.isSelect = !widget.model.isSelect;
            setState(() {});
          },
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color:
                      widget.model.isSelect ? AppColors.red : AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: widget.model.isSelect
                    ? const Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: Colors.white,
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(width: 8),
              Text(
                widget.model.title,
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
        if (widget.model.isSelect)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: CustomTextFormField(
              controller: TextEditingController(),
              validator: Validator.date,
              // onTap: () => _selectDate(
              //   context: context,
              //   controller: _birthdayPetController,
              // ),
              label: 'Дата последней прививки',
              readOnly: true,
            ),
          ),
      ],
    );
  }
}

class VactinationCheckBoxModel {
  final String title;
  bool isSelect = false;
  String date = '';

  VactinationCheckBoxModel({required this.title});
}
