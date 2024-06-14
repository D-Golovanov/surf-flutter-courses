class UserProfileModel {
  final String name;
  final String email;
  final DateTime birth;
  final String team;
  final String position;
  final List<String> awards;
  final String avatar;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.birth,
    required this.team,
    required this.position,
    required this.avatar,
    required this.awards,
  });
}
