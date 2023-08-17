part of 'color_box_grid_bloc.dart';

@immutable
sealed class ColorBoxGridEvent extends Equatable {}

class LoadColorBoxGridEvent extends ColorBoxGridEvent {
  @override
  List<Object?> get props => [];
}
