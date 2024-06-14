import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/core/build_context_extension.dart';

class AwardsWidget extends StatelessWidget {
  final List<String> awards;
  const AwardsWidget({super.key, required this.awards});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Мои награды', style: context.textStyle.hintText),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            awards.length,
            (index) => _MedalTextWidget(medal: awards[index]),
          ).toList(),
        )
      ],
    );
  }
}

class _MedalTextWidget extends StatelessWidget {
  final String medal;
  const _MedalTextWidget({
    required this.medal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        medal,
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}
