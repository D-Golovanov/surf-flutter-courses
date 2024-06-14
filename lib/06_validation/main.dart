import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/info_pet_screen_model.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/view/info_pet_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      theme: AppTheme.ligthTheme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FormModel(),
          ),
        ],
        child: const InfoPetScreen(),
      ),
    );
  }
}
