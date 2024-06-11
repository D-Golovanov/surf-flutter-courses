import 'package:surf_flutter_courses_template/06_validation/core/string_constants.dart';

enum TypePet {
  dog(
    title: StringConstants.dogTitle,
    path: 'assets/images/icon-dog.svg',
    vactination: true,
  ),
  cat(
    title: StringConstants.catTitle,
    path: 'assets/images/icon-cat.svg',
    vactination: true,
  ),
  parrot(
    title: StringConstants.parrotTitle,
    path: 'assets/images/icon-parrot.svg',
    vactination: false,
  ),
  hamster(
    title: StringConstants.hamsterTitle,
    path: 'assets/images/icon-hamster.svg',
    vactination: false,
  );

  const TypePet({
    required this.title,
    required this.path,
    required this.vactination,
  });
  final String title;
  final String path;
  final bool vactination;
}
