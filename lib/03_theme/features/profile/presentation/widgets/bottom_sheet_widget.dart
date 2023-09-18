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
      CurrentTheme currentThemeGroup =
          ChangeNotifierProvider.read<ThemeModel>(context)!
              .getTheme()
              .currentThemeEnum!;

      return BodyBottoSheet(currentThemeGroup: currentThemeGroup);
    },
  );
}

class BodyBottoSheet extends StatefulWidget {
  const BodyBottoSheet({
    super.key,
    required this.currentThemeGroup,
  });

  final CurrentTheme currentThemeGroup;

  @override
  State<BodyBottoSheet> createState() => _BodyBottoSheetState();
}

class _BodyBottoSheetState extends State<BodyBottoSheet> {
  late String prevTheme;
  late String prevScheme;

  @override
  void initState() {
    prevTheme = ChangeNotifierProvider.read<ThemeModel>(context)!.getTheme();
    prevScheme = ChangeNotifierProvider.read<ThemeModel>(context)!.getScheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                group: widget.currentThemeGroup,
              ),
              RadioListTileWidget(
                title: 'Светлая',
                value: CurrentTheme.light,
                group: widget.currentThemeGroup,
              ),
              if (ChangeNotifierProvider.watch<ThemeModel>(context)!
                      .getTheme() ==
                  CurrentTheme.light.currentThemeString)
                const SchemeButtonsWidget(),
              RadioListTileWidget(
                title: 'Темная',
                value: CurrentTheme.dark,
                group: widget.currentThemeGroup,
              ),
              if (ChangeNotifierProvider.watch<ThemeModel>(context)!
                      .getTheme() ==
                  CurrentTheme.dark.currentThemeString)
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
              final a = context.findAncestorStateOfType<_BodyBottoSheetState>();
              if (a != null) {
                ChangeNotifierProvider.read<ThemeModel>(context)!
                    .setTheme(a.prevTheme);
                ChangeNotifierProvider.read<ThemeModel>(context)!
                    .setScheme(a.prevScheme);
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
