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
  late InfoPetScreenModel model;

  void _validationInput() {
    widget.modelValue.error = widget.validator!(widget.modelValue.value.text);
    setState(() {});
  }

  void _unFocusInput() {
    widget.modelValue.value.text = widget.modelValue.value.text.trim();

    if (!_focusNode.hasFocus) {
      if (widget.validator != null) {
        widget.modelValue.error =
            widget.validator!(widget.modelValue.value.text);
        setState(() {});
      }
      model.validationForm();
    }
  }

  @override
  void initState() {
    model = context.read<InfoPetScreenModel>();
    if (widget.vlaidationOnChange) {
      widget.modelValue.value.addListener(_validationInput);
    }
    _focusNode.addListener(_unFocusInput);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.vlaidationOnChange) {
      widget.modelValue.value.removeListener(_validationInput);
    }
    widget.modelValue.value.dispose();
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
          focusNode: _focusNode,
          controller: widget.modelValue.value,
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
