import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/color_box_grid/presentation/bloc/color_box_grid_bloc.dart';

class ErrorMessageWidget extends StatelessWidget {
  final Object? message;
  const ErrorMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$message',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () => context
                    .read<ColorBoxGridBloc>()
                    .add(LoadColorBoxGridEvent()),
                icon: const Icon(Icons.replay),
                label: const Text('Повторить'),
              )
            ],
          ),
        ));
  }
}
