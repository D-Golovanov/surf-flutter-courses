import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/user_profile_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/domain/repository/theme_repository.dart';

import 'features/profile/presentation/profile.dart';
import 'features/widgets/widgets.dart';

class ThemeChangeApp extends StatefulWidget {
  const ThemeChangeApp({super.key});

  @override
  State<ThemeChangeApp> createState() => _ThemeChangeAppState();
}

class _ThemeChangeAppState extends State<ThemeChangeApp>
    with WidgetsBindingObserver {
  final _themeModel = ThemeModel();

  Future<void> _initTheme() async {
    final getIt = GetIt.I<IThemeRepository>();
    final themePref = await getIt.getTheme();
    final schemePref = await getIt.getScheme();

    _themeModel.setTheme(themePref);
    _themeModel.setScheme(schemePref);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initTheme().then((_) => _themeModel.getThemeData());
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (_themeModel.getTheme() == CurrentTheme.system.currentThemeString) {
      _themeModel.setTheme(CurrentTheme.system.currentThemeString);
    }
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
          home: Profile(user: userGettingBefore),
          theme:
              ChangeNotifierProvider.watch<ThemeModel>(context)!.getThemeData(),
        );
      }),
    );
  }
}
