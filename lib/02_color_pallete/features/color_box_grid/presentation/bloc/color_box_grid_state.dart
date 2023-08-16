part of 'color_box_grid_bloc.dart';

@immutable
sealed class ColorBoxGridState {}

// final class ColorBoxGridInitial extends ColorBoxGridState {}

final class ColorBoxGridLoading extends ColorBoxGridState {}

final class ColorBoxGridLoaded extends ColorBoxGridState {
  final ColorsBoxGridModel colorsGrid;

  ColorBoxGridLoaded({required this.colorsGrid});
}

final class ColorBoxGridFailure extends ColorBoxGridState {
  final Object? exeption;

  ColorBoxGridFailure({this.exeption});
}
