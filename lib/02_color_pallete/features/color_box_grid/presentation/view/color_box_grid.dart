import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/widgets/widgets.dart';

import '../bloc/color_box_grid_bloc.dart';

class ColorBoxGrid extends StatefulWidget {
  const ColorBoxGrid({super.key});

  @override
  State<ColorBoxGrid> createState() => _ColorBoxGridState();
}

class _ColorBoxGridState extends State<ColorBoxGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const AppBarSliverWidget(),
          BlocBuilder<ColorBoxGridBloc, ColorBoxGridState>(
            builder: (context, state) {
              return switch (state) {
                ColorBoxGridLoading _ =>
                  const CircularProgressIndicatorWidget(),
                ColorBoxGridLoaded(colorsGrid: final colorsGrid) =>
                  ColorBoxGridWidget(colorBoxGrid: colorsGrid),
                ColorBoxGridFailure(exception: final e) =>
                  ErrorMessageWidget(message: e),
              };
            },
          ),
        ],
      ),
    );
  }
}
