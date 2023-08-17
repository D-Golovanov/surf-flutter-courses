part of 'color_box_grid_bloc.dart';

@immutable
sealed class ColorBoxGridState extends Equatable {}

final class ColorBoxGridLoading extends ColorBoxGridState {
  @override
  List<Object?> get props => [];
}

final class ColorBoxGridLoaded extends ColorBoxGridState {
  final ColorsBoxGridModel colorsGrid;

  ColorBoxGridLoaded({required this.colorsGrid});

  @override
  List<Object?> get props => [colorsGrid];
}

final class ColorBoxGridFailure extends ColorBoxGridState {
  final Object? exception;

  ColorBoxGridFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}
