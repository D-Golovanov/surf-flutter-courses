import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/sorting_type_model.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';
import 'package:surf_flutter_courses_template/01_product_list/utils/utils.dart';

class SliverPriceWidget extends StatelessWidget {
  final SortingTypeModel model;

  const SliverPriceWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    double sum = getSum(model.productList);
    double sumSale = getSumWithSale(model.productList);

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const Divider(),
            const SizedBox(height: 24.0),
            const Text(AppStrings.yourPurchase, style: AppStyle.text16Bold),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.productList.length} ${getDeclinationProducts(model.productList.length)}',
                  style: AppStyle.cardText12Regular,
                ),
                Text(
                  '${getFractionalOrIntegerNumber(toRubles(sum))} ${AppStrings.rub}',
                  style: AppStyle.cardText12Bold,
                )
              ],
            ),
            const SizedBox(height: 11.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppStrings.sale} ${getSale(sum, sumSale)}%',
                  style: AppStyle.cardText12Regular,
                ),
                Text(
                  '-${getFractionalOrIntegerNumber(toRubles(sum - sumSale))} ${AppStrings.rub}',
                  style: AppStyle.cardText12Bold,
                )
              ],
            ),
            const SizedBox(height: 11.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppStrings.result, style: AppStyle.text16Bold),
                Text(
                    '${getFractionalOrIntegerNumber(toRubles(sum - (sum - sumSale)))} ${AppStrings.rub}',
                    style: AppStyle.text16Bold)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
