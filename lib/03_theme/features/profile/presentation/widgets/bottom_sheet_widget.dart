import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/presentation/widgets/widgets.dart';
import 'package:surf_flutter_courses_template/03_theme/features/widgets/widgets.dart';

void showThemeBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
    ),
    builder: (context) {
      AppThemeMode currentThemeGroup =
          ChangeNotifierProvider.read<ThemeModel>(context)!.theme;

      return BodyBottomSheet(currentThemeGroup: currentThemeGroup);
    },
  );
}

class BodyBottomSheet extends StatefulWidget {
  const BodyBottomSheet({
    super.key,
    required this.currentThemeGroup,
  });

  final AppThemeMode currentThemeGroup;

  @override
  State<BodyBottomSheet> createState() => _BodyBottomSheetState();
}

class _BodyBottomSheetState extends State<BodyBottomSheet> {
  late AppThemeMode prevTheme;
  late AppSchemeMode prevScheme;

  @override
  void initState() {
    final themeModel = ChangeNotifierProvider.read<ThemeModel>(context)!;
    prevTheme = themeModel.theme;
    prevScheme = themeModel.scheme;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = ChangeNotifierProvider.watch<ThemeModel>(context)!;

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
                value: AppThemeMode.system,
                group: widget.currentThemeGroup,
              ),
              RadioListTileWidget(
                title: 'Светлая',
                value: AppThemeMode.light,
                group: widget.currentThemeGroup,
              ),
              if (themeModel.theme == AppThemeMode.light)
                const SchemeButtonsWidget(),
              RadioListTileWidget(
                title: 'Темная',
                value: AppThemeMode.dark,
                group: widget.currentThemeGroup,
              ),
              if (themeModel.theme == AppThemeMode.dark)
                const SchemeButtonsWidget(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Готово'),
              ),
            ],
          ),
        ),
      ],
    );
  }
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
              final a =
                  context.findAncestorStateOfType<_BodyBottomSheetState>();
              if (a != null) {
                final themeModel =
                    ChangeNotifierProvider.read<ThemeModel>(context)!;

                themeModel.setTheme(a.prevTheme);
                themeModel.setScheme(a.prevScheme);
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
