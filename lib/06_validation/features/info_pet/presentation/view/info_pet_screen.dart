import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/form_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/input_formattrs.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/vactination_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class InfoPetScreen extends StatefulWidget {
  const InfoPetScreen({super.key});

  @override
  State<InfoPetScreen> createState() => _InfoPetScreenState();
}

class _InfoPetScreenState extends State<InfoPetScreen> {
  @override
  Widget build(BuildContext context) {
    InfoPetScreenModel model = context.watch<InfoPetScreenModel>();

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
                    Consumer<InfoPetScreenModel>(
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
                    ),
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      validator: Validator.name,
                      label: 'Имя питомца',
                      modelValue: model.nameInputModel,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'^\s'))
                      ],
                    ),
                    const SizedBox(height: 16),
                    // CustomTextFormField(
                    //   modelValue: model.birthdayInputModel,
                    //   validator: Validator.date,
                    //   vlaidationOnChange: true,
                    //   onTap: () => datePicker(
                    //     context: context,
                    //     controller: _birthdayPetController,
                    //   ),
                    //   label: 'День рождения питомца',
                    //   readOnly: true,
                    // ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      modelValue: model.weigthInputModel,
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
                      modelValue: model.emailInputModel,
                      validator: Validator.email,
                      label: 'Почта хозяина',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Consumer<InfoPetScreenModel>(
                      builder: (_, model, __) {
                        return model.type.vactination
                            ? VactinationFormWidget()
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 48.0),
                    Consumer<InfoPetScreenModel>(
                      builder: (_, model, __) {
                        return ElevatedButton(
                          onPressed: (model.formState == ButtonState.enable)
                              ? () {
                                  print('$model');
                                }
                              : null,
                          child: const Text('Отправить'),
                        );
                      },
                    ),
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

/*

class InfoPetScreen extends StatefulWidget {
  const InfoPetScreen({super.key});

  @override
  State<InfoPetScreen> createState() => _InfoPetScreenState();
}

class _InfoPetScreenState extends State<InfoPetScreen> {
  final formModel = FormModel();
  final vactinatioFormModel = VactinationFormModel();

  // final _currentTypePet = ValueNotifier<TypePet>(TypePet.dog);
  final _buttonNotifier = ValueNotifier<ButtonState>(ButtonState.disabled);

  final _namePetController = TextEditingController();
  final _birthdayPetController = TextEditingController();
  final _weigthPetController = TextEditingController();
  final _emailPetController = TextEditingController();

  void buttonState() {
    if (formModel.validation() && vactinatioFormModel.validation()) {
      _buttonNotifier.value = ButtonState.enable;
    } else {
      _buttonNotifier.value = ButtonState.disabled;
    }
  }

  @override
  void initState() {
    // focusNode.addListener(() {
    //   if (!focusNode.hasFocus) {
    //     _formKey.currentState!.validate();
    //   }
    // });
    _namePetController
        .addListener(() => formModel.setName(_namePetController.text));
    _birthdayPetController
        .addListener(() => formModel.setBirthday(_birthdayPetController.text));
    _weigthPetController
        .addListener(() => formModel.setWeigth(_weigthPetController.text));
    _emailPetController
        .addListener(() => formModel.setEmail(_emailPetController.text));
/*
    _namePetController.addListener(formSubmit);
    _birthdayPetController.addListener(formSubmit);
    _weigthPetController.addListener(formSubmit);
    _emailPetController.addListener(formSubmit);
*/
    super.initState();
  }

  @override
  void dispose() {
    // _currentTypePet.dispose();
    _buttonNotifier.dispose();

    _namePetController.dispose();
    _birthdayPetController.dispose();
    _weigthPetController.dispose();
    _emailPetController.dispose();

    _birthdayPetController.dispose();

    super.dispose();
  }

  // void formSubmit() {
  //   if (Validator.name(_namePetController.text) == null &&
  //       Validator.date(_birthdayPetController.text) == null &&
  //       Validator.weigth(_weigthPetController.text) == null &&
  //       Validator.email(_emailPetController.text) == null) {
  //     if (_currentTypePet.value == TypePet.dog ||
  //         _currentTypePet.value == TypePet.cat) {
  //       final itemNotValidVactination = vactinationWidgetList.where(
  //           (element) => element.isSelect == true && element.date.isEmpty);
  //     } else {
  //       _buttonNotifier.value = ButtonState.enable;
  //     }
  //   } else {
  //     _buttonNotifier.value = ButtonState.disabled;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final fm = context.watch<FormModel>();
    print(fm);

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
                    ListenableBuilder(
                      listenable: formModel,
                      builder: (context, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...TypePet.values.map(
                              (petItem) => GestureDetector(
                                onTap: () => formModel.setType(petItem),
                                child: PetButton(
                                  pet: petItem,
                                  isActive:
                                      formModel.type.title == petItem.title,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    // ValueListenableBuilder<TypePet>(
                    //   valueListenable: _currentTypePet,
                    //   builder: (_, __, ___) {
                    //     return Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         ...TypePet.values.map(
                    //           (petItem) => GestureDetector(
                    //             onTap: () => _currentTypePet.value = petItem,
                    //             child: PetButton(
                    //               pet: petItem,
                    //               isActive: _currentTypePet.value.title ==
                    //                   petItem.title,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                    const SizedBox(height: 32),
                    TextFormField(
                      onChanged: formModel.setName,
                    ),

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
                      vlaidationOnChange: true,
                      onTap: () => datePicker(
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
                    ListenableBuilder(
                      listenable: formModel,
                      builder: (context, child) {
                        return switch (formModel.type) {
                          TypePet.dog || TypePet.cat => VactinationFormWidget(
                              vactinationFormModel: vactinatioFormModel),
                          _ => const SizedBox.shrink(),
                        };
                      },
                    ),
                    // ValueListenableBuilder<TypePet>(
                    //   valueListenable: _currentTypePet,
                    //   builder: (_, state, __) {
                    //     return switch (state) {
                    //       TypePet.dog || TypePet.cat => const Vactination(),
                    //       _ => const SizedBox.shrink(),
                    //     };
                    //   },
                    // ),
                    const SizedBox(height: 48),
                    AnimatedBuilder(
                      animation:
                          Listenable.merge([formModel, vactinatioFormModel]),
                      builder: (context, _) {
                        return ElevatedButton(
                          onPressed: (formModel.buttonState ==
                                  ButtonState.enable)
                              ? () {
                                  // print('Type: ${_currentTypePet.value.title}');
                                  print('Name: ${_namePetController.text}');
                                  print(
                                      'Birthday: ${_birthdayPetController.text}');
                                  print('Weigth: ${_weigthPetController.text}');
                                  print('email: ${_emailPetController.text}');
                                  vactinationWidgetList.forEach((element) {
                                    print(element);
                                  });

                                  _namePetController.clear();
                                }
                              : null,
                          child: const Text('Отправить'),
                        );
                      },
                    ),
                    ListenableBuilder(
                      listenable: formModel,
                      builder: (context, child) {
                        return ElevatedButton(
                          onPressed: (formModel.buttonState ==
                                  ButtonState.enable)
                              ? () {
                                  // print('Type: ${_currentTypePet.value.title}');
                                  print('Name: ${_namePetController.text}');
                                  print(
                                      'Birthday: ${_birthdayPetController.text}');
                                  print('Weigth: ${_weigthPetController.text}');
                                  print('email: ${_emailPetController.text}');
                                  vactinationWidgetList.forEach((element) {
                                    print(element);
                                  });

                                  _namePetController.clear();
                                }
                              : null,
                          child: const Text('Отправить'),
                        );
                      },
                    ),
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: _buttonNotifier,
                      builder: (_, state, __) {
                        return ElevatedButton(
                          onPressed: (state == ButtonState.enable)
                              ? () {
                                  print('submit');
                                }
                              : null,
                          child: const Text('Отправить'),
                        );
                      },
                    ),
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
*/