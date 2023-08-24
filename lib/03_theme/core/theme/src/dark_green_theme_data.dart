part of '../theme.dart';

final darkGreenThemeData = ThemeData(
  extensions: <ThemeExtension<ThemeTextStyles>>[
    ThemeTextStyles(
        hintText: const TextStyle(
      color: GreenColorPallete.darkGrey600,
    ))
  ],
  brightness: Brightness.dark,
  primaryColor: GreenColorPallete.green,
  scaffoldBackgroundColor: GreenColorPallete.black,
  textTheme: const TextTheme(
    // list tile title
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: GreenColorPallete.white,
    ),
    // body main text scaffold
    bodyMedium: TextStyle(),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: GreenColorPallete.black,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.7,
      color: GreenColorPallete.white,
    ),
    iconTheme: IconThemeData(
      color: GreenColorPallete.green,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: GreenColorPallete.darkGrey900,
    iconColor: GreenColorPallete.green,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: GreenColorPallete.red,
      side: const BorderSide(color: GreenColorPallete.red),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.14,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: GreenColorPallete.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);
