import 'package:flutter/material.dart';

Future<String?> datePicker(
    {required BuildContext context,
    required TextEditingController controller}) async {
  DateTime currentDate = DateTime.now();
  DateTime? prevSelectDat;

  if (controller.text.isNotEmpty) {
    final splitDate = controller.text.split('.');
    prevSelectDat =
        DateTime.parse('${splitDate[2]}-${splitDate[1]}-${splitDate[0]}');
  }

  final DateTime? picked = await showDatePicker(
    context: context,
    locale: const Locale('ru', 'RU'),
    initialDate: prevSelectDat ?? currentDate,
    firstDate: DateTime(currentDate.year - 20),
    lastDate: currentDate,
  );

  if (picked != null) {
    controller.text =
        '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
    return '';
  } else {
    return '';
  }
}
