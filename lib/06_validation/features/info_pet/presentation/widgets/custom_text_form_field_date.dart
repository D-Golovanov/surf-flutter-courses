import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/widgets/widgets.dart';

class CustomTextFormFieldDate extends StatefulWidget {
  final String label;
  final Input modelValue;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;

  const CustomTextFormFieldDate({
    super.key,
    required this.label,
    required this.modelValue,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
  });

  @override
  State<CustomTextFormFieldDate> createState() =>
      _CustomTextFormFieldDateState();
}

class _CustomTextFormFieldDateState extends State<CustomTextFormFieldDate> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  String? errorText;

  bool _firstTapFocus = false;

  late FormModel fm;

  @override
  void initState() {
    fm = context.read<FormModel>();
    // _controller.addListener(_onChange);
    _focusNode.addListener(_onFocus);
    widget.modelValue.active = true;
    super.initState();
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocus)
      ..dispose();
    _controller.dispose();
    widget.modelValue.active = false;
    widget.modelValue.value = '';
    widget.modelValue.isError = false;
    super.dispose();
  }

  void _onFocus() {
    if (_focusNode.hasFocus && _firstTapFocus) {
      String tmpValue = _controller.text.trim();
      final validValue = widget.validator!(tmpValue);

      if (validValue != null) {
        widget.modelValue.isError = true;
        errorText = validValue;
      } else {
        widget.modelValue.value = tmpValue;
        widget.modelValue.isError = false;
        errorText = null;
      }

      _controller.text = tmpValue;
      fm.validationForm();
      widget.modelValue.hasFocus = false;
      setState(() {});
    }
    _firstTapFocus = true;
  }

/*
  void _onChange() {
    String tmpValue = _controller.text.trim();
    final validValue = widget.validator!(tmpValue);

    if (validValue != null) {
      widget.modelValue.isError = true;
      errorText = validValue;
    } else {
      widget.modelValue.value = tmpValue;
      widget.modelValue.isError = false;
      errorText = null;
    }

    _controller.text = tmpValue;
    fm.validationForm();
    widget.modelValue.hasFocus = false;
    setState(() {});
  }
*/
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
        ValueListenableBuilder<ButtonState>(
            valueListenable: fm.buttonState,
            builder: (_, state, __) {
              return TextFormField(
                enabled: state == ButtonState.sending ? false : true,
                focusNode: _focusNode,
                controller: _controller,
                onTap: () async {
                  datePicker(context: context, controller: _controller);
                },
                style: TextStyle(
                  color: widget.modelValue.isError ? AppColors.red : null,
                ),
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                readOnly: widget.readOnly,
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  errorText: errorText,
                  label: Text(widget.label),
                ),
              );
            }),
      ],
    );
  }
}
