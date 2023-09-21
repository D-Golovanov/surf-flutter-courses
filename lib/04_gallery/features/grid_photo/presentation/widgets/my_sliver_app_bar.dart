import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      pinned: false,
      floating: true,
      snap: true,
      centerTitle: true,
      title: Image.asset(
        'assets/images/logo_postgram.png',
        width: 140,
      ),
    );
  }
}
