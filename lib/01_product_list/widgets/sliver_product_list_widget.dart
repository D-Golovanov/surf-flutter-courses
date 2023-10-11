import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/sorting_type_model.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/product_card_widget.dart';

class SliverProductListWidget extends StatelessWidget {
  final SortingTypeModel model;

  const SliverProductListWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: ListenableBuilder(
          listenable: model,
          builder: (context, child) {
            if (model.sortingType == SortingType.type ||
                model.sortingType == SortingType.typeDESC) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, indexCategory) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.categoryList.keys.elementAt(indexCategory),
                        style: AppStyle.text16Bold,
                      ),
                      ...List.generate(
                          model.categoryList.values
                              .elementAt(indexCategory)
                              .length, (indexProduct) {
                        return ProductCardWidget(
                          product: model.categoryList.values
                              .elementAt(indexCategory)[indexProduct],
                        );
                      }),
                      (indexCategory == model.categoryList.length - 1)
                          ? const SizedBox.shrink()
                          : const Column(
                              children: [
                                Divider(),
                                SizedBox(height: 20.0),
                              ],
                            )
                    ],
                  ),
                  childCount: model.categoryList.length,
                ),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductCardWidget(
                    product: model.productList[index],
                  ),
                  childCount: model.productList.length,
                ),
              );
            }
          }),
    );
  }
}
