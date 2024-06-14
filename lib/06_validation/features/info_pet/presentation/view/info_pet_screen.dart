import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/string_constants.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/input_formattrs.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class InfoPetScreen extends StatefulWidget {
  const InfoPetScreen({super.key});

  @override
  State<InfoPetScreen> createState() => _InfoPetScreenState();
}

class _InfoPetScreenState extends State<InfoPetScreen> {
  late FormModel fm;

  @override
  void initState() {
    fm = context.read<FormModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      label: StringConstants.labelName,
                      modelValue: fm.name,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^\s'))
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormFieldDate(
                      modelValue: fm.birthday,
                      validator: Validator.date,
                      label: StringConstants.labelBirthday,
                      readOnly: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      modelValue: fm.weigth,
                      validator: Validator.weigth,
                      label: StringConstants.labelWeigth,
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
                      modelValue: fm.email,
                      validator: Validator.email,
                      label: StringConstants.labelEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ValueListenableBuilder<TypePet>(
                      valueListenable: fm.typePet,
                      builder: (_, state, __) {
                        return state.vactination
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
