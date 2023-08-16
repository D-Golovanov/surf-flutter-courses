import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/repository/color_box_impl.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/widgets/widgets.dart';

import '../bloc/color_box_grid_bloc.dart';

class ColorBoxGrid extends StatefulWidget {
  const ColorBoxGrid({super.key});

  @override
  State<ColorBoxGrid> createState() => _ColorBoxGridState();
}

class _ColorBoxGridState extends State<ColorBoxGrid> {
  final _colorBoxBloc = ColorBoxGridBloc(
      colorBoxRepository:
          ColorBoxRepositoryImpl(data: ColorBoxLocalDataSourceImpl()));

  @override
  void initState() {
    _colorBoxBloc.add(LoadColorBoxGridEvent());
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
            bloc: _colorBoxBloc,
            builder: (context, state) {
              return switch (state) {
                ColorBoxGridLoading _ =>
                  const CircularProgressIndicatorWidget(),
                ColorBoxGridLoaded(colorsGrid: final colorsGrid) =>
                  ColorBoxGridWidget(colorBoxGrid: colorsGrid),
                ColorBoxGridFailure(exeption: final e) => SliverToBoxAdapter(
                    child: Center(
                      child: Text('$e'),
                    ),
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
