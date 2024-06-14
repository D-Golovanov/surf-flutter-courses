part of '../theme.dart';

class ColorsExtensions extends ThemeExtension<ColorsExtensions> {
  final Color schemeButtonBackground;
  final Color schemeButtonTextNotSelected;

  ColorsExtensions({
    required this.schemeButtonBackground,
    required this.schemeButtonTextNotSelected,
  });

  @override
  ThemeExtension<ColorsExtensions> copyWith({
    Color? schemeButtonBackground,
    Color? schemeButtonTextNotSelected,
  }) {
    return ColorsExtensions(
      schemeButtonBackground:
          schemeButtonBackground ?? this.schemeButtonBackground,
      schemeButtonTextNotSelected:
          schemeButtonTextNotSelected ?? this.schemeButtonTextNotSelected,
    );
  }

  @override
  ThemeExtension<ColorsExtensions> lerp(
      covariant ThemeExtension<ColorsExtensions>? other, double t) {
    if (other is! ColorsExtensions) {
      return this;
    }
    return ColorsExtensions(
      schemeButtonBackground:
          Color.lerp(schemeButtonBackground, other.schemeButtonBackground, t)!,
      schemeButtonTextNotSelected: Color.lerp(
          schemeButtonTextNotSelected, other.schemeButtonTextNotSelected, t)!,
    );
  }
}
