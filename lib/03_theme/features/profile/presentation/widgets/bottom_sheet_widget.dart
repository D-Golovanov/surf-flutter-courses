import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/presentation/widgets/widgets.dart';
import 'package:surf_flutter_courses_template/03_theme/features/widgets/widgets.dart';

void showThemeBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
    ),
    builder: (context) {
      CurrentTheme currentThemeGroup =
          ChangeNotifierProvider.read<ThemeModel>(context)!
              .getTheme()
              .currentThemeEnum!;

      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 8, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TitleBottomSheet(),
                const SizedBox(height: 8),
                RadioListTileWidget(
                  title: 'Системная',
                  value: CurrentTheme.system,
                  group: currentThemeGroup,
                ),
                RadioListTileWidget(
                  title: 'Светлая',
                  value: CurrentTheme.light,
                  group: currentThemeGroup,
                ),
                if (ChangeNotifierProvider.watch<ThemeModel>(context)!
                        .getTheme() ==
                    CurrentTheme.light.currentThemeString)
                  const SchemeButtonsWidget(),
                RadioListTileWidget(
                  title: 'Темная',
                  value: CurrentTheme.dark,
                  group: currentThemeGroup,
                ),
                if (ChangeNotifierProvider.watch<ThemeModel>(context)!
                        .getTheme() ==
                    CurrentTheme.dark.currentThemeString)
                  const SchemeButtonsWidget(),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Готово'),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

class TitleBottomSheet extends StatelessWidget {
  const TitleBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Тема оформления',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
