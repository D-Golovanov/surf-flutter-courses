import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/input_formattrs.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class InfoPetScreen extends StatefulWidget {
  const InfoPetScreen({super.key});

  @override
  State<InfoPetScreen> createState() => _InfoPetScreenState();
}

class _InfoPetScreenState extends State<InfoPetScreen> {
  @override
  Widget build(BuildContext context) {
    InfoPetScreenModel formModel = context.watch<InfoPetScreenModel>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 40),
                    const TypePetRowButtonsWidget(),
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      validator: Validator.name,
                      label: 'Имя питомца',
                      modelValue: formModel.nameInputModel,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^\s'))
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      modelValue: formModel.birthdayInputModel,
                      validator: Validator.date,
                      vlaidationOnChange: true,
                      onTap: () => datePicker(
                        context: context,
                        controller: formModel.birthdayInputModel.controller,
                      ),
                      label: 'День рождения питомца',
                      readOnly: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      modelValue: formModel.weigthInputModel,
                      validator: Validator.weigth,
                      label: 'Вес, кг',
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d*[\.,]?\d?\d?|\d?[\.,])\d?\d?')),
                        Decimal(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      modelValue: formModel.emailInputModel,
                      validator: Validator.email,
                      label: 'Почта хозяина',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Consumer<InfoPetScreenModel>(
                      builder: (_, model, __) {
                        return model.type.vactination
                            ? const VactinationFormWidget()
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 48.0),
                    const SubmitButtonWidget(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
