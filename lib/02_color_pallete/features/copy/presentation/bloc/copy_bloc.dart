import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/domain/copy_repository.dart';

part 'copy_event.dart';
part 'copy_state.dart';

class CopyBloc extends Bloc<CopyEvent, CopyState> {
  final ICopyRepository copyRepository;

  CopyBloc({required this.copyRepository}) : super(CopyInitial()) {
    on<CopyValueEvent>((event, emit) async {
      try {
        final message = await copyRepository.copyValue(event.value);
        emit(CopyValue(value: message));
      } catch (e) {
        emit(CopyFailure(exception: e));
      }
    });
  }
}
