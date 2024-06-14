import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/sorting_type_model.dart';
import 'package:surf_flutter_courses_template/01_product_list/mocks.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_colors.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/bottom_bar_widget.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/sliver_app_bar_widget.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/sliver_price_widget.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/sliver_product_list_widget.dart';
import 'package:surf_flutter_courses_template/01_product_list/widgets/sort_row_widget.dart';

void main() {
  runApp(const ShesterochkaApp());
}

class ShesterochkaApp extends StatelessWidget {
  const ShesterochkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckScreen(productList: dataForStudents),
    );
  }
}

class CheckScreen extends StatefulWidget {
  final List<ProductEntity> productList;
  const CheckScreen({super.key, required this.productList});

  @override
  State<CheckScreen> createState() => CheckScreenState();
}

class CheckScreenState extends State<CheckScreen> {
  final SortingTypeModel model = SortingTypeModel();

  @override
  void initState() {
    super.initState();
    model.loadList(widget.productList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBurWidget(),
            SliverPersistentHeader(
              floating: true,
              delegate: StickySortingRowDelegat(model: model),
            ),
            SliverProductListWidget(model: model),
            SliverPriceWidget(model: model)
          ],
        ),
      ),
      bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
