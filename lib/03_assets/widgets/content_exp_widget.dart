import 'package:flutter/material.dart';

class ContentExp extends StatelessWidget {
  const ContentExp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Печальный 😅'),
        const SizedBox(height: 8.0),
        ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset('assets/images/mem.png')),
      ],
    );
  }
}
