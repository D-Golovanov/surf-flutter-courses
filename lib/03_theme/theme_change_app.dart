import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/user_profile_model.dart';
import 'package:surf_flutter_courses_template/03_theme/main.dart';

import 'features/profile/presentation/profile.dart';
import 'features/widgets/widgets.dart';

class ThemeChangeApp extends StatefulWidget {
  const ThemeChangeApp({super.key});

  @override
  State<ThemeChangeApp> createState() => _ThemeChangeAppState();
}

class _ThemeChangeAppState extends State<ThemeChangeApp>
    with WidgetsBindingObserver {
  final ThemeModel _themeModel = injector();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _themeModel.loadFromCache();
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    _themeModel.setSystemThemeFromBrightness();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final userGettingBefore = UserProfileModel(
      name: 'Маркус Хассельборг',
      email: 'MarkusHSS@gmail.com',
      birth: DateTime(1986, 3, 3),
      team: 'Сборная Швеции',
      position: 'Скип',
      avatar:
          'https://w7.pngwing.com/pngs/700/759/png-transparent-avatars-accounts-man-male-people-person-glasses-broken-hoodie-male-avatars-free-d-illustration.png',
      awards: ['🥇', '🥇', '🥉', '🥈', '🥉'],
    );

    return ChangeNotifierProvider(
      model: _themeModel,
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProfileScreen(user: userGettingBefore),
          theme:
              ChangeNotifierProvider.watch<ThemeModel>(context)!.getThemeData(),
        );
      }),
    );
  }
}
