import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/05_magic/application.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/data/repository/get_magic_text_impl.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/domain/repository/get_magic_text_repository.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/presentation/view/magic_ball_screen.dart';

import 'package:dio/dio.dart';

class DIContainer {
  static final IGetTextRepository _apiService = GetMagicTextImpl(
    Dio(
      BaseOptions(
        method: 'GET',
        baseUrl: 'https://eightballapi.com',
        connectTimeout: const Duration(seconds: 3),
      ),
    ),
  );

  static final Widget _homeScreen = MagicBallScreen(repository: _apiService);

  static final Widget createApp = MainApp(homeScreen: _homeScreen);

  DIContainer._();

  static final DIContainer _instance = DIContainer._();

  factory DIContainer() {
    return _instance;
  }
}
