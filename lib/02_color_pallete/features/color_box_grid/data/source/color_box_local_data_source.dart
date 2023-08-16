import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/config/constaint_config.dart';

abstract interface class ColorBoxLocalDataSource {
  Future<String> getAssetsFile();
}

class ColorBoxLocalDataSourceImpl extends ColorBoxLocalDataSource {
  @override
  Future<String> getAssetsFile() =>
      rootBundle.loadString(ConstantConfig.assetsPath);
}
