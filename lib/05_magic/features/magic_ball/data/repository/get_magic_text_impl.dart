import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/domain/repository/get_magic_text_repository.dart';

class GetMagicTextImpl implements IGetTextRepository {
  final Dio dio;

  GetMagicTextImpl(this.dio);

  @override
  Future<String> getText() async {
    try {
      final response = await dio.get('/api');
      return response.data['reading'];
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
