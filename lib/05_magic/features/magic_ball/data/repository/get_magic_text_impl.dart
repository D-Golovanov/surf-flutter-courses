import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/data/model/magic_text_model.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/domain/repository/get_magic_text_repository.dart';

class GetMagicTextImpl implements IGetMagicTextRepository {
  final _dio = Dio();

  @override
  Future<MagicTextModel> getMagicText() async {
    try {
      final response = await _dio.get('https://eightballapi.com/api');
      return MagicTextModel(text: response.data['reading']);
    } on DioException catch (e) {
      return MagicTextModel(
          text: e.message ?? 'Звезды не отвечают...\nПопробуй еще',
          error: true);
    }
  }
}
