part of '../theme.dart';

abstract class SchemeColor {
  Color get primary;
  Color get error;

  Color get backgroundLight;
  Color get backgroundDark;

  Color get textLight;
  Color get textDark;

  Color get secondary;

  Color get surfaceBackgroundLight;
  Color get surfaceBackgroundDark;

  Color get schemeButtonLight;
  Color get schemeButtonDark;
}

class BlueSchemeColor implements SchemeColor {
  @override
  Color get primary => const Color(0xFF5261EB);
  @override
  Color get error => const Color(0xFFFF392A);

  @override
  Color get backgroundLight => const Color(0xFFF4F7FC);
  @override
  Color get backgroundDark => const Color(0xFF242439);

  @override
  Color get textDark => const Color(0xFFFFFFFF);
  @override
  Color get textLight => const Color(0xFF222222);

  @override
  Color get secondary => const Color(0xFF7B8EBE);

  @override
  Color get surfaceBackgroundDark => const Color(0xFF384057);
  @override
  Color get surfaceBackgroundLight => const Color(0xFFFFFFFF);

  @override
  Color get schemeButtonDark => const Color(0xFF444C65);
  @override
  Color get schemeButtonLight => const Color(0xFFF5F8FD);
}

class GreenSchemeColor implements SchemeColor {
  @override
  Color get primary => const Color(0xFF6DD902);
  @override
  Color get error => const Color(0xFFFF392A);

  @override
  Color get backgroundLight => const Color(0xFFFFFFFF);
  @override
  Color get backgroundDark => const Color(0xFF000000);

  @override
  Color get textLight => const Color(0xFF222222);
  @override
  Color get textDark => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFF77767B);

  @override
  Color get surfaceBackgroundLight => const Color(0xFFFAFAFA);
  @override
  Color get surfaceBackgroundDark => const Color(0xFF222222);

  @override
  Color get schemeButtonLight => const Color(0xFFF6F6F6);
  @override
  Color get schemeButtonDark => const Color(0xFF292929);
}

class OrangeSchemeColor implements SchemeColor {
  @override
  Color get primary => const Color(0xFFFF7A00);
  @override
  Color get error => const Color(0xFFFF392A);

  @override
  Color get backgroundLight => const Color(0xFFFCF8F4);
  @override
  Color get backgroundDark => const Color(0xFF262020);

  @override
  Color get textLight => const Color(0xFF262020);
  @override
  Color get textDark => const Color(0xFFFFFFFF);

  @override
  Color get secondary => const Color(0xFFBE937B);

  @override
  Color get surfaceBackgroundLight => const Color(0xFFFFFFFF);
  @override
  Color get surfaceBackgroundDark => const Color(0xFF3C322F);

  @override
  Color get schemeButtonLight => const Color(0xFFFAF8F7);
  @override
  Color get schemeButtonDark => const Color(0xFF4A3F3B);
}
