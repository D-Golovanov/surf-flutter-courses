import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_style.dart';
import 'package:surf_flutter_courses_template/01_product_list/utils/utils.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductCardWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final amount = getAmount(product.amount);
    final price = getFractionalOrIntegerNumber(toRubles(product.price));
    final saledPrice = product.sale > 0.0
        ? getFractionalOrIntegerNumber(toRubles(priceWithSale(product)))
        : null;

    return Column(
      children: [
        const SizedBox(height: 16.0),
        SizedBox(
          height: 68.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 68.0,
                width: 68.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.imageUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppStyle.cardText12Regular,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          amount,
                          style: AppStyle.cardText12Regular,
                        ),
                        Row(
                          children: [
                            if (saledPrice != null)
                              Text(
                                '$price ${AppStrings.rub}',
                                style: AppStyle.cardText12RegularThrough,
                              ),
                            const SizedBox(width: 16.0),
                            Text(
                              '${saledPrice ?? price} ${AppStrings.rub}',
                              style: product.sale > 0.0
                                  ? AppStyle.cardText12Bold
                                      .copyWith(color: AppColors.red)
                                  : AppStyle.cardText12Bold,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
