import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldModel {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final GestureTapCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool vlaidationOnChange;

  const CustomTextFieldModel({
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
}
