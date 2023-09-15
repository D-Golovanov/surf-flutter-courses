import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/widgets/widgets.dart';

class RadioListTileWidget extends StatelessWidget {
  final String title;
  final CurrentTheme value;
  final CurrentTheme group;

  const RadioListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<CurrentTheme>(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      title: Text(title),
      value: value,
      groupValue: group,
      onChanged: (value) {
        ChangeNotifierProvider.read<ThemeModel>(context)!
            .setTheme(value!.currentThemeString);
      },
    );
  }
}
