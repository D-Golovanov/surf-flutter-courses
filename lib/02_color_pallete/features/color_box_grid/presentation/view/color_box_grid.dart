import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/widgets/widgets.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/common/widgets/snack_bar.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/presentation/bloc/copy_bloc.dart';

import '../bloc/color_box_grid_bloc.dart';

class ColorBoxGrid extends StatefulWidget {
  const ColorBoxGrid({super.key});

  @override
  State<ColorBoxGrid> createState() => _ColorBoxGridState();
}

class _ColorBoxGridState extends State<ColorBoxGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<CopyBloc, CopyState>(
        listener: (context, state) {
          return switch (state) {
            CopyInitial() => null,
            CopyValue() => showSnackBar(context: context, message: state.value),
            CopyFailure() => showSnackBar(
                context: context, message: state.exception.toString()),
          };
        },
        child: CustomScrollView(
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
      ),
    );
  }
}
