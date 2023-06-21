import 'package:flutter/material.dart';

import 'widgets/content_block.dart';
import 'widgets/content_exp_widget.dart';
import 'widgets/contet_hobbies_widget.dart';
import 'widgets/header.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Визитка'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              Header(
                firstName: 'Данил',
                secondName: 'А.',
                quote: 'Одна ошибка и ты ошибся. ⓒЖека',
              ),
              SizedBox(height: 24.0),
              ContentBlock(
                title: 'О себе',
                iconPath: 'assets/images/profile.svg',
                contentWidget: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              ),
              SizedBox(height: 24.0),
              ContentBlock(
                title: 'Увлечения',
                iconPath: 'assets/images/game.svg',
                contentWidget: ContentHobbies(),
              ),
              SizedBox(height: 24.0),
              ContentBlock(
                title: 'Опыт в разработке',
                iconPath: 'assets/images/work.svg',
                contentWidget: ContentExp(),
              ),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
