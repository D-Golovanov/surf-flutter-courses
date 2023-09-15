import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/core/theme/theme.dart';

extension BuildContextExtension on BuildContext {
  TextStylesExtension get textStyle =>
      Theme.of(this).extension<TextStylesExtension>()!;

  ColorsExtensions get color => Theme.of(this).extension<ColorsExtensions>()!;
}
