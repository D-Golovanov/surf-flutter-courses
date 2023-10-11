part of 'copy_bloc.dart';

@immutable
sealed class CopyState extends Equatable {}

final class CopyInitial extends CopyState {
  @override
  List<Object?> get props => [];
}

final class CopyValue extends CopyState {
  final String value;

  CopyValue({required this.value});
  @override
  List<Object?> get props => [value];
}

final class CopyFailure extends CopyState {
  final Object? exception;

  CopyFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}
