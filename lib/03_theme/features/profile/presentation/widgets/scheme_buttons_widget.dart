import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/03_theme/core/build_context_extension.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/scheme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/profile/data/models/theme_model.dart';
import 'package:surf_flutter_courses_template/03_theme/features/widgets/widgets.dart';

class SchemeButtonsWidget extends StatelessWidget {
  const SchemeButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final schemeButtonList = [
      SchemeModel(
        title: AppSchemeMode.green,
        iconPath: 'assets/images/icon_scheme_green.svg',
      ),
      SchemeModel(
        title: AppSchemeMode.blue,
        iconPath: 'assets/images/icon_scheme_blue.svg',
      ),
      SchemeModel(
        title: AppSchemeMode.orange,
        iconPath: 'assets/images/icon_scheme_orange.svg',
      ),
    ];

    final themeModel = ChangeNotifierProvider.watch<ThemeModel>(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text('Цветовая схема', style: context.textStyle.hintText),
        const SizedBox(height: 16),
        SizedBox(
          height: 66,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: schemeButtonList.length,
            itemBuilder: (context, index) {
              final schemeButton = schemeButtonList[index];

              bool isSelected = schemeButton.title == themeModel.scheme;

              return GestureDetector(
                onTap: () {
                  ChangeNotifierProvider.read<ThemeModel>(context)!
                      .setScheme(schemeButton.title);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.color.schemeButtonBackground,
                    border: isSelected
                        ? Border.all(width: 1, color: theme.primaryColor)
                        : null,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(schemeButton.iconPath),
                      const SizedBox(height: 4),
                      Text(
                        'Схема ${index + 1}',
                        style: isSelected
                            ? theme.textTheme.bodySmall
                            : theme.textTheme.bodySmall?.copyWith(
                                color:
                                    context.color.schemeButtonTextNotSelected,
                              ),
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
