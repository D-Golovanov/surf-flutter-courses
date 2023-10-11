import 'package:flutter/material.dart';

class AvatarProfileWidget extends StatelessWidget {
  final String url;
  const AvatarProfileWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
