import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/domain/repository/get_magic_text_repository.dart';

class GetMagicTextImpl implements IGetMagicTextRepository {
  final _dio = Dio();

  @override
  Future<String> getMagicText() async {
    final response = await _dio.get('https://eightballapi.com/api');
    return response.data['reading'];
  }
}
