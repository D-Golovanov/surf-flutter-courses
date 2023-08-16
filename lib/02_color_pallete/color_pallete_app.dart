import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/view/color_box_grid.dart';

class ColorPalleteApp extends StatelessWidget {
  const ColorPalleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ColorBoxGrid(),
        // '/details': (context) => DetailScreen(),
      },
    );
  }
}
