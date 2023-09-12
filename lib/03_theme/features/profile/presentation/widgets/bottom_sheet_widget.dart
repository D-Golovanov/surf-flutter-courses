import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/03_theme/core/theme/theme.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
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
                SizedBox(
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
                ),
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

class SchemeModel {
  final String title;
  final String iconPath;

  SchemeModel({required this.title, required this.iconPath});
}

class SchemeButtonsWidget extends StatelessWidget {
  const SchemeButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final schemeButtonList = [
      SchemeModel(
        title: CurrentScheme.green.currentSchemeString,
        iconPath: 'assets/images/icon_scheme_green.svg',
      ),
      SchemeModel(
        title: CurrentScheme.blue.currentSchemeString,
        iconPath: 'assets/images/icon_scheme_blue.svg',
      ),
      SchemeModel(
        title: CurrentScheme.orange.currentSchemeString,
        iconPath: 'assets/images/icon_scheme_orange.svg',
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text('Цветовая схема',
            style:
                Theme.of(context).extension<TextStylesExtension>()!.hintText),
        const SizedBox(height: 16),
        SizedBox(
          height: 66,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: schemeButtonList.length,
            itemBuilder: (context, index) {
              bool isSelected = schemeButtonList[index].title ==
                  ChangeNotifierProvider.read<ThemeModel>(context)!.getScheme();

              return GestureDetector(
                onTap: () {
                  ChangeNotifierProvider.read<ThemeModel>(context)!
                      .setScheme(schemeButtonList[index].title);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context)
                        .extension<ColorsExtensions>()!
                        .schemeButtonBackground,
                    border: isSelected
                        ? Border.all(
                            width: 1, color: Theme.of(context).primaryColor)
                        : null,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(schemeButtonList[index].iconPath),
                      const SizedBox(height: 4),
                      Text(
                        'Схема ${index + 1}',
                        style: isSelected
                            ? Theme.of(context).textTheme.bodySmall
                            : Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context)
                                    .extension<ColorsExtensions>()!
                                    .schemeButtonTextNotSelected),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class RadioListTileWidget extends StatelessWidget {
  final String title;
  final CurrentTheme value;
  final CurrentTheme group;

  const RadioListTileWidget({
    super.key,
    required this.title,
    required this.value,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<CurrentTheme>(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
      title: Text(title),
      value: value,
      groupValue: group,
      onChanged: (value) {
        ChangeNotifierProvider.read<ThemeModel>(context)!
            .setTheme(value!.currentThemeString);
      },
    );
  }
}
