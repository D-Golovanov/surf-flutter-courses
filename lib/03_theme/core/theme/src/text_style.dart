part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle hintText;

  ThemeTextStyles({required this.hintText});

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? hintText,
  }) {
    return ThemeTextStyles(hintText: hintText ?? this.hintText);
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      hintText: TextStyle.lerp(hintText, other.hintText, t)!,
    );
  }
}
