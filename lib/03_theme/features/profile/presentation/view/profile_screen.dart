import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/user_profile_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfileModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBarWidget(title: 'Профиль'),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 8),
                AvatarProfileWidget(url: user.avatar),
                const SizedBox(height: 24),
                AwardsWidget(awards: user.awards),
                const SizedBox(height: 24),
                InfoListWidget(
                  user: user,
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Log out'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
