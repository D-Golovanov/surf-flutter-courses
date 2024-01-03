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
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _focusNode = FocusNode();

  String? errorText;

  void unFocus() {
    widget.controller.text = widget.controller.text.trim();
    if (!_focusNode.hasFocus) {
      if (widget.validator != null) {
        errorText = widget.validator!(widget.controller.text);
        setState(() {});
        print(widget.controller.text);
        // _focusNode.nextFocus();
      }
    }
  }

  @override
  void initState() {
    _focusNode.addListener(unFocus);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(unFocus)
      ..dispose();
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
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: widget.validator,
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
