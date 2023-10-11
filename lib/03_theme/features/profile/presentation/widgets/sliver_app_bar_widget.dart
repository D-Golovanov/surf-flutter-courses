import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  final String title;
  const SliverAppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      centerTitle: true,
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Save'),
        ),
      ],
    );
  }
}
