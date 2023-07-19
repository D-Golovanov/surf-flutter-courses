import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';

class AppStyle {
  static const largeTitle20Bold = TextStyle(
    color: AppColors.darkText,
    fontSize: 20.0,
    height: 24.0 / 20.0,
    fontWeight: FontWeight.w700,
  );

  static const largeTitle18Bold = TextStyle(
    color: AppColors.darkText,
    fontSize: 18.0,
    height: 24.0 / 18.0,
    fontWeight: FontWeight.w700,
  );

  static const button16Bold = TextStyle(
    color: AppColors.white,
    fontSize: 16.0,
    height: 20.0 / 16.0,
    fontWeight: FontWeight.w700,
  );

  static const text16Bold = TextStyle(
    color: AppColors.darkText,
    fontSize: 16.0,
    height: 24.0 / 16.0,
    fontWeight: FontWeight.w700,
  );

  static const radioText16Regular = TextStyle(
    color: AppColors.darkText,
    fontSize: 16.0,
    height: 24.0 / 16.0,
    fontWeight: FontWeight.w400,
  );

  static const cardText12Regular = TextStyle(
    color: AppColors.darkText,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 16.0 / 12.0,
  );
  static const cardText12RegularThrough = TextStyle(
      color: AppColors.grey,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 16.0 / 12.0,
      decoration: TextDecoration.lineThrough);

  static const cardText12Bold = TextStyle(
    color: AppColors.darkText,
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    height: 16.0 / 12.0,
  );
  static const smallDate10Regular = TextStyle(
    color: AppColors.greyText,
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    height: 16.0 / 10.0,
  );

  static const smallUnselectedLabel10SemiBold = TextStyle(
    color: AppColors.greyText,
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    height: 12.6 / 10.0,
    letterSpacing: -0.24,
  );

  static const smallSelectedLabel10SemiBold = TextStyle(
    color: AppColors.green,
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    height: 12.6 / 10.0,
    letterSpacing: -0.24,
  );
}
