part of 'copy_bloc.dart';

@immutable
sealed class CopyEvent extends Equatable {}

class CopyValueEvent extends CopyEvent {
  final String value;

  CopyValueEvent({required this.value});
  @override
  List<Object?> get props => [value];
}
