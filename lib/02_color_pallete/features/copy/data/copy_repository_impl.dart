import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/features/copy/domain/copy_repository.dart';

class CopyRepositoryImpl implements ICopyRepository {
  @override
  Future<String> copyValue(String value) async {
    try {
      await Clipboard.setData(ClipboardData(text: value));
      final copyData = await Clipboard.getData(Clipboard.kTextPlain);
      if (copyData != null) {
        return copyData.text!;
      }
      throw Exception('Что-то не так');
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
