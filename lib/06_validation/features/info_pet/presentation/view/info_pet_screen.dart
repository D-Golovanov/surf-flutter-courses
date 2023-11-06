import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/input_formattrs.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/data/text_field_on_changed_with_validator.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/text_form_field_state.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    _currentTypePet.dispose();

    _namePetController
      ..removeListener(_formSubmit)
      ..dispose();

    _birthdayPetController.dispose();

    _weigthPetController.dispose();

    _emailPetController.dispose();

    super.dispose();
  }

  void _formSubmit() {
    if (Validator.name(_namePetController.text) == null) {
      _buttonNotifier.value = ButtonState.enable;
    } else {
      _buttonNotifier.value = ButtonState.disabled;
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAECEB),
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
                        }),
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
                      validator: Validator.name,
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
                        Decimal(),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      controller: _emailPetController,
                      validator: Validator.email,
                      label: 'Почта хозяина',
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        // Email(),
                      ],
                    ),
                    /*
                    ValueListenableBuilder<TextFormFieldState>(
                      valueListenable: _birthdayPetState,
                      builder: (_, state, __) {
                        return CustomTextFormField(
                          controller: _birthdayPetController,
                          state: state,
                          // onChanged: (value) =>
                          //     TextFieldOnChangedWithValidator(_birthdayPetState)
                          //         .email(value),
                          onTap: () => _selectDate(context),
                          label: 'День рождения питомца',
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder<TextFormFieldState>(
                      valueListenable: _weigthPetState,
                      builder: (_, state, __) {
                        return CustomTextFormField(
                          controller: _weigthPetController,
                          state: state,
                          // onChanged: (value) =>
                          //     TextFieldOnChangedWithValidator(_weigthPetState)
                          // .minNum(value, min: 0),
                          label: 'Вес, кг',
                          keyboardType: TextInputType.number,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder<TextFormFieldState>(
                      valueListenable: _emailPetState,
                      builder: (_, state, __) {
                        return CustomTextFormField(
                          controller: _emailPetController,
                          label: 'Почта хозяина',
                          // onChanged: (value) =>
                          //     TextFieldOnChangedWithValidator(_emailPetState)
                          //         .email(value),
                          state: state,
                          keyboardType: TextInputType.emailAddress,
                        );
                      },
                    ),*/
                    const SizedBox(height: 48),
                    Theme(
                      data: ThemeData(
                        elevatedButtonTheme: ElevatedButtonThemeData(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF8087),
                            foregroundColor: Color(0xFFFFFFFF),
                            disabledBackgroundColor: Color(0xFFD3D5D8),
                            disabledForegroundColor: Color(0xFFFFFFFF),
                            minimumSize: const Size.fromHeight(48.0),
                            elevation: 16.0,
                            shadowColor: Color(0xFFFF8087).withOpacity(.24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      child: ValueListenableBuilder<ButtonState>(
                          valueListenable: _buttonNotifier,
                          builder: (_, state, __) {
                            return ElevatedButton(
                              onPressed: (state == ButtonState.enable)
                                  ? () {
                                      print(_namePetController.text);

                                      print(_birthdayPetController.text);
                                    }
                                  : null,
                              child: Text('Отправить'),
                            );
                          }),
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
