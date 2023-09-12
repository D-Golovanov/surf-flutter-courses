part of '../theme.dart';

class TextStylesExtension extends ThemeExtension<TextStylesExtension> {
  final TextStyle hintText;

  TextStylesExtension({required this.hintText});

  @override
  ThemeExtension<TextStylesExtension> copyWith({
    TextStyle? hintText,
  }) {
    return TextStylesExtension(hintText: hintText ?? this.hintText);
  }

  @override
  ThemeExtension<TextStylesExtension> lerp(
      covariant ThemeExtension<TextStylesExtension>? other, double t) {
    if (other is! TextStylesExtension) {
      return this;
    }
    return TextStylesExtension(
      hintText: TextStyle.lerp(hintText, other.hintText, t)!,
    );
  }
}
