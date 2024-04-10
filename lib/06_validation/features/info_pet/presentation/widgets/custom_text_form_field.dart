import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool vlaidationOnChange;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
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

  String? errorText;

  void _validationInput() {
    errorText = widget.validator!(widget.controller.text);
    setState(() {});
  }

  void _unFocus() {
    widget.controller.text = widget.controller.text.trim();
    if (!_focusNode.hasFocus) {
      if (widget.validator != null) {
        errorText = widget.validator!(widget.controller.text);
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    if (widget.vlaidationOnChange) {
      widget.controller.addListener(_validationInput);
    }
    _focusNode.addListener(_unFocus);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.vlaidationOnChange) {
      widget.controller.removeListener(_validationInput);
    }
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
          controller: widget.controller,
          onTap: widget.onTap,
          style: TextStyle(
            color: errorText == null ? null : AppColors.red,
          ),
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            errorText: errorText,
            label: Text(widget.label),
          ),
        ),
      ],
    );
  }
}
