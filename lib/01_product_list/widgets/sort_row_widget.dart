import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/sorting_type_model.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_assets.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/modal_bottom_sheet.dart';

class StickySortingRowDelegat extends SliverPersistentHeaderDelegate {
  final SortingTypeModel model;

  StickySortingRowDelegat({required this.model});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            AppStrings.shoppingList,
            style: AppStyle.largeTitle18Bold,
          ),
          Stack(
            children: [
              SizedBox(
                height: 32.0,
                width: 32.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.ligthGrey,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () => showSortingBottomSheet(
                      context: context,
                      model: model,
                    ),
                    icon: SvgPicture.asset(AppAssets.sort),
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: model,
                builder: (context, _) {
                  double size =
                      model.sortingType != SortingType.none ? 8.0 : 0.0;

                  return Positioned(
                    bottom: 5.0,
                    right: 5.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
