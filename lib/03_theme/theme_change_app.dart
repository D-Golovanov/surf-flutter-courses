import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/core/theme/theme.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/user_profile_model.dart';

import 'features/profile/presentation/profile.dart';

class ThemeChangeApp extends StatelessWidget {
  const ThemeChangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userGettingBefore = UserProfileModel(
      name: 'Маркус Хассельборг',
      email: 'MarkusHSS@gmail.com',
      birth: DateTime(1986, 03, 03),
      team: 'Сборная Швеции',
      position: 'Скип',
      avatar:
          'https://w7.pngwing.com/pngs/700/759/png-transparent-avatars-accounts-man-male-people-person-glasses-broken-hoodie-male-avatars-free-d-illustration.png',
      awards: ['🥇', '🥇', '🥉', '🥈', '🥉'],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(user: userGettingBefore),
      theme: AppTheme.darkGreenTheme,
    );
  }
}
