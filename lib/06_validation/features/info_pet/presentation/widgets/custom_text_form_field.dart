import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final InputModel modelValue;
  final String? Function(String?)? validator;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool vlaidationOnChange;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.modelValue,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.vlaidationOnChange = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _focusNode = FocusNode();
  late InfoPetScreenModel formModel;

  void _validationInput() {
    widget.modelValue.error =
        widget.validator!(widget.modelValue.controller.text);
    setState(() {});
    formModel.validationForm();
  }

  void _unFocusInput() {
    print('32');
    widget.modelValue.controller.text =
        widget.modelValue.controller.text.trim();

    if (!_focusNode.hasFocus) {
      if (widget.validator != null) {
        widget.modelValue.error =
            widget.validator!(widget.modelValue.controller.text);
        setState(() {});
      }
      formModel.validationForm();
    }
  }

  @override
  void initState() {
    formModel = context.read<InfoPetScreenModel>();
    formModel.addInputForm(widget.modelValue);

    if (widget.vlaidationOnChange) {
      widget.modelValue.controller.addListener(_validationInput);
    }
    if (!widget.readOnly) {
      _focusNode.addListener(_unFocusInput);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (!widget.readOnly) {
      _focusNode.dispose();
    }
    if (widget.vlaidationOnChange) {
      widget.modelValue.controller.removeListener(_validationInput);
    }
    formModel.removeInputForm(widget.modelValue);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        TextFormField(
          //enabled: formModel.buttonState == ButtonState.sending ? false : true,
          focusNode: _focusNode,
          controller: widget.modelValue.controller,
          onTap: widget.onTap,
          style: TextStyle(
            color: widget.modelValue.error == null ? null : AppColors.red,
          ),
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            errorText: widget.modelValue.error,
            label: Text(widget.label),
          ),
        ),
      ],
    );
  }
}
