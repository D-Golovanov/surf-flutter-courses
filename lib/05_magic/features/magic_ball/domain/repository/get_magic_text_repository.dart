import 'package:surf_flutter_courses_template/05_magic/features/magic_ball/data/model/magic_text_model.dart';

abstract interface class IGetMagicTextRepository {
  Future<MagicTextModel> getMagicText();
}
