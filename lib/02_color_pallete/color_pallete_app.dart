import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/bloc/color_box_grid_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/view/color_box_grid.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/domain/copy_repository.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/presentation/bloc/copy_bloc.dart';

class ColorPalleteApp extends StatelessWidget {
  const ColorPalleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ColorBoxGridBloc(
              colorBoxRepository: GetIt.I<IColorBoxRepository>())
            ..add(LoadColorBoxGridEvent()),
        ),
        BlocProvider(
          create: (context) =>
              CopyBloc(copyRepository: GetIt.I<ICopyRepository>()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: const ColorBoxGrid(),
      ),
    );
  }
}
