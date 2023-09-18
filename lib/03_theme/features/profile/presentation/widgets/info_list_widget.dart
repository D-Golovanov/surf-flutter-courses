import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/core/build_context_extension.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/user_profile_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/presentation/widgets/widgets.dart';
import 'package:surf_flutter_courses_template/03_theme/features/widgets/widgets.dart';

class InfoListWidget extends StatelessWidget {
  final UserProfileModel user;
  const InfoListWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileWidget(subtitle: 'Имя', title: user.name),
        const SizedBox(height: 8),
        ListTileWidget(subtitle: 'Email', title: user.email),
        const SizedBox(height: 8),
        ListTileWidget(
            subtitle: 'Дата рождения',
            title:
                '${user.birth.day.toString().padLeft(2, '0')}.${user.birth.month.toString().padLeft(2, '0')}.${user.birth.year}'),
        const SizedBox(height: 8),
        ListTileWidget(subtitle: 'Команда', title: user.team, onTap: () {}),
        const SizedBox(height: 8),
        ListTileWidget(subtitle: 'Позиция', title: user.position, onTap: () {}),
        const SizedBox(height: 8),
        ListTileWidget(
            subtitle: 'Тема оформления',
            title: ChangeNotifierProvider.read<ThemeModel>(context)!
                .getTextTheme(),
            onTap: () => showThemeBottomSheet(context: context)),
        const SizedBox(height: 24),
      ],
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String subtitle;
  final String title;
  final VoidCallback? onTap;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: context.textStyle.hintText,
          ),
          Text(title),
        ],
      ),
      trailing: onTap != null
          ? const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            )
          : null,
    );
  }
}
