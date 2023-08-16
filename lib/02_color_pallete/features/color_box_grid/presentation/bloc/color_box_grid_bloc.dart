import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/data/models/colors_grid_model.dart';

import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/domain/repository/color_box_repository.dart';

part 'color_box_grid_event.dart';
part 'color_box_grid_state.dart';

class ColorBoxGridBloc extends Bloc<ColorBoxGridEvent, ColorBoxGridState> {
  final ColorBoxRepository colorBoxRepository;

  ColorBoxGridBloc({required this.colorBoxRepository})
      : super(ColorBoxGridLoading()) {
    on<LoadColorBoxGridEvent>((event, emit) async {
      try {
        final colorBoxGrid = await colorBoxRepository.getColorBoxes();
        emit(ColorBoxGridLoaded(colorsGrid: colorBoxGrid));
      } catch (e) {
        emit(ColorBoxGridFailure(exeption: e));
      }
    });
  }
}
