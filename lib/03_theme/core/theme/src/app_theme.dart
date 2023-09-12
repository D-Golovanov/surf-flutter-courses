part of '../theme.dart';

class AppTheme {
  final SchemeColor scheme;

  AppTheme({required this.scheme});

  ThemeData get ligthThemeData {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scheme.backgroundLight,
      extensions: <ThemeExtension<dynamic>>[
        TextStylesExtension(
          hintText: TextStyle(
            color: scheme.secondary,
          ),
        ),
        ColorsExtensions(
          schemeButtonBackground: scheme.schemeButtonLight,
          schemeButtonTextNotSelected: scheme.secondary,
        ),
      ],
      textTheme: TextTheme(
        // list tile title
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: scheme.textLight,
        ),
        // title bottom sheet
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.33,
          color: scheme.textLight,
        ),
        // body main text scaffold
        bodyMedium: const TextStyle(),
        // scheme button text
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.33,
          color: scheme.textLight,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.backgroundLight,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.7,
          color: scheme.textLight,
        ),
        iconTheme: IconThemeData(
          color: scheme.primary,
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: scheme.surfaceBackgroundLight,
        iconColor: scheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: scheme.textDark),
          elevation: 0,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.backgroundLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: scheme.error,
          side: BorderSide(color: scheme.error),
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
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: scheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return scheme.primary;
          }
          return scheme.secondary;
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceBackgroundLight,
      ),
    );
  }

  ThemeData get darkThemeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: scheme.primary,
      scaffoldBackgroundColor: scheme.backgroundDark,
      extensions: <ThemeExtension<dynamic>>[
        TextStylesExtension(
          hintText: TextStyle(
            color: scheme.secondary,
          ),
        ),
        ColorsExtensions(
          schemeButtonBackground: scheme.schemeButtonDark,
          schemeButtonTextNotSelected: scheme.secondary,
        ),
      ],
      textTheme: TextTheme(
        // list tile title
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
          color: scheme.textDark,
        ),
        // title bottom sheet
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.33,
          color: scheme.textDark,
        ),
        // body main text scaffold
        bodyMedium: const TextStyle(),
        // scheme button text
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.33,
          color: scheme.textDark,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.backgroundDark,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.7,
          color: scheme.textDark,
        ),
        iconTheme: IconThemeData(
          color: scheme.primary,
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: scheme.surfaceBackgroundDark,
        iconColor: scheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: scheme.textDark,
          ),
          elevation: 0,
          backgroundColor: scheme.primary,
          foregroundColor: scheme.backgroundDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: scheme.error,
          side: BorderSide(color: scheme.error),
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
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: scheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return scheme.primary;
          }
          return scheme.secondary;
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceBackgroundDark,
      ),
    );
  }
}
