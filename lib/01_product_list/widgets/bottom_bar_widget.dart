import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_assets.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 0.0,
          showSelectedLabels: true,
          selectedLabelStyle: AppStyle.smallSelectedLabel10SemiBold,
          showUnselectedLabels: true,
          unselectedLabelStyle: AppStyle.smallUnselectedLabel10SemiBold,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.catalog),
              label: AppStrings.catalog,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.search),
              label: AppStrings.search,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.basket),
              label: AppStrings.basket,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.person),
              label: AppStrings.person,
            ),
          ],
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.ligthGrey),
          ),
        ),
      ],
    );
  }
}
