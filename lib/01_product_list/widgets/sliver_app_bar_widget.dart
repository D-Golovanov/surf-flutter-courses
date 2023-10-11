import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';

class SliverAppBurWidget extends StatelessWidget {
  const SliverAppBurWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      title: Column(
        children: [
          Text(AppStrings.checkNumber, style: AppStyle.largeTitle18Bold),
          Text(AppStrings.checkDate, style: AppStyle.smallDate10Regular),
        ],
      ),
    );
  }
}
