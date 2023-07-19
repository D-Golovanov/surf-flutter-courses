import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/01_product_list/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/01_product_list/utils/utils.dart';

enum SortingType { none, name, nameDESC, price, priceDESC, type, typeDESC }

class SortingTypeModel extends ChangeNotifier {
  SortingType sortingType = SortingType.none;

  late final List<ProductEntity> loadedProductList;
  late List<ProductEntity> productList;
  Map<String, List<ProductEntity>> categoryList = {};

  void changeType(SortingType type) {
    sortingType = type;
    switch (type) {
      case SortingType.none:
        resetList();
      case SortingType.name:
        sortNameASC();
      case SortingType.nameDESC:
        sortNameDESC();
      case SortingType.price:
        sortPriceASC();
      case SortingType.priceDESC:
        sortPriceDESC();
      case SortingType.type:
        sortTypeASC();
      case SortingType.typeDESC:
        sortTypeDESC();
    }
    notifyListeners();
  }

  void resetList() => productList = List.from(loadedProductList);

  void sortNameASC() => productList.sort((a, b) => a.title.compareTo(b.title));
  void sortNameDESC() => productList.sort((a, b) => b.title.compareTo(a.title));

  void sortPriceASC() {
    productList.sort((a, b) {
      final priceA = a.sale != 0.0 ? priceWithSale(a) : a.price;
      final priceB = b.sale != 0.0 ? priceWithSale(b) : b.price;
      return priceA.compareTo(priceB);
    });
  }

  void sortPriceDESC() {
    productList.sort((a, b) {
      final priceA = a.sale != 0.0 ? priceWithSale(a) : a.price;
      final priceB = b.sale != 0.0 ? priceWithSale(b) : b.price;
      return priceB.compareTo(priceA);
    });
  }

  void sortTypeASC() {
    categoryList.clear();
    for (ProductEntity product in productList) {
      if (!categoryList.containsKey(product.category.name)) {
        categoryList[product.category.name] = [];
      }
      categoryList[product.category.name]?.add(product);
    }
    categoryList = Map.fromEntries(
        categoryList.entries.toList()..sort((a, b) => a.key.compareTo(b.key)));
  }

  void sortTypeDESC() {
    categoryList.clear();
    for (ProductEntity product in productList) {
      if (!categoryList.containsKey(product.category.name)) {
        categoryList[product.category.name] = [];
      }
      categoryList[product.category.name]?.add(product);
    }
    categoryList = Map.fromEntries(
        categoryList.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));
  }

  void loadList(List<ProductEntity> list) {
    loadedProductList = list;
    resetList();
    notifyListeners();
  }
}
