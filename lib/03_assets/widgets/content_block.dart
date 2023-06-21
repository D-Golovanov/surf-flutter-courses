import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentBlock extends StatelessWidget {
  final String title;
  final String iconPath;
  final Widget contentWidget;

  const ContentBlock({
    super.key,
    required this.title,
    required this.iconPath,
    required this.contentWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary,
            blurRadius: 16.0,
            offset: const Offset(0.0, 4.0),
            spreadRadius: -12.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w900),
              ),
              SvgPicture.asset(
                iconPath,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const Divider(),
          contentWidget,
        ],
      ),
    );
  }
}
