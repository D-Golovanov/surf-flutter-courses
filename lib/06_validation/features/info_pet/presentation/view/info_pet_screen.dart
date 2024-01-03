import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/input_formattrs.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

/*
  data: {
    type : Enum (dog, cat...)*,
    name : String*,
    born : Date*,
    weigth : double*,
    email : Srting*,

    vactination : [
      {
        title : String
        date : Date
      },
      {
        title : String
        date : Date
      }
    ]
  }
*/
enum ButtonState { enable, disabled, sending }

class InfoPetScreen extends StatefulWidget {
  const InfoPetScreen({super.key});

  @override
  State<InfoPetScreen> createState() => _InfoPetScreenState();
}

class _InfoPetScreenState extends State<InfoPetScreen> {
  final _formKey = GlobalKey<FormState>();

  final _currentTypePet = ValueNotifier<TypePet>(TypePet.hamster);

  final _namePetController = TextEditingController();
  final _birthdayPetController = TextEditingController();
  final _weigthPetController = TextEditingController();
  final _emailPetController = TextEditingController();

  final _buttonNotifier = ValueNotifier<ButtonState>(ButtonState.disabled);

  @override
  void initState() {
    // focusNode.addListener(() {
    //   if (!focusNode.hasFocus) {
    //     _formKey.currentState!.validate();
    //   }
    // });

    _namePetController.addListener(_formSubmit);
    _weigthPetController.addListener(_formSubmit);
    _emailPetController.addListener(_formSubmit);
    super.initState();
  }

  @override
  void dispose() {
    _currentTypePet.dispose();

    _namePetController
      ..removeListener(_formSubmit)
      ..dispose();
    _weigthPetController
      ..removeListener(_formSubmit)
      ..dispose();
    _emailPetController
      ..removeListener(_formSubmit)
      ..dispose();

    _birthdayPetController.dispose();

    super.dispose();
  }

  void _formSubmit() {
    if (Validator.name(_namePetController.text) == null &&
        Validator.weigth(_weigthPetController.text) == null &&
        Validator.email(_emailPetController.text) == null) {
      _buttonNotifier.value = ButtonState.enable;
    } else {
      _buttonNotifier.value = ButtonState.disabled;
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(
      {required BuildContext context,
      required TextEditingController controller}) async {
    print(selectedDate);
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 20),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text =
            '${selectedDate.day.toString().padLeft(2, '0')}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(top: 40, bottom: 24),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ValueListenableBuilder<TypePet>(
                      valueListenable: _currentTypePet,
                      builder: (_, __, ___) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...TypePet.values.map(
                              (petItem) => GestureDetector(
                                onTap: () => _currentTypePet.value = petItem,
                                child: PetButton(
                                  pet: petItem,
                                  isActive: _currentTypePet.value.title ==
                                      petItem.title,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      controller: _namePetController,
                      validator: Validator.name,
                      label: 'Имя питомца',
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^\s'))
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _birthdayPetController,
                      validator: Validator.date,
                      onTap: () => _selectDate(
                        context: context,
                        controller: _birthdayPetController,
                      ),
                      label: 'День рождения питомца',
                      readOnly: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _weigthPetController,
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
                      controller: _emailPetController,
                      validator: Validator.email,
                      label: 'Почта хозяина',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ValueListenableBuilder<TypePet>(
                      valueListenable: _currentTypePet,
                      builder: (_, state, __) {
                        return switch (state) {
                          TypePet.dog || TypePet.cat => const Vactination(),
                          _ => const SizedBox.shrink(),
                        };
                      },
                    ),
                    const SizedBox(height: 48),
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: _buttonNotifier,
                      builder: (_, state, __) {
                        return ElevatedButton(
                          onPressed: (state == ButtonState.enable)
                              ? () {
                                  print(_namePetController.text);

                                  print(_birthdayPetController.text);
                                }
                              : null,
                          child: const Text('Отправить'),
                        );
                      },
                    ),
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
