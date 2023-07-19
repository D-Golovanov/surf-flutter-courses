import 'package:surf_flutter_courses_template/01_product_list/domain/product_entity.dart';
import 'package:surf_flutter_courses_template/01_product_list/res/app_strings.dart';

/// Функция отображения количества товара в граммах или штуках
String getAmount(Amount amount) {
  return switch (amount) {
    Grams gm =>
      '${getFractionalOrIntegerNumber(gm.value / 1000)} ${AppStrings.kg}',
    Quantity q => '${q.value} ${AppStrings.sht}',
  };
}

/// Функция получения целого или дробного числа (цены, количества) для вывода
String getFractionalOrIntegerNumber(double value) {
  // final splitNumber = value.toString().split('.');
  // return '${splitNumber[0]}${(splitNumber[1] != '0' ? '.${splitNumber[1]}' : '')}';
  return value.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
}

/// Перевод в рубли из копеек
double toRubles(num price) => price / 100;

/// Расчитать цену со скидкой
double priceWithSale(ProductEntity product) =>
    product.price - product.price * product.sale / 100;

String getDeclinationProducts(int value) {
  final declinations = ['товар', 'товара', 'товаров'];

  value = value.abs() % 100;
  int num = value % 10;

  if (value > 10 && value < 20) return declinations[2];
  if (num > 1 && num < 5) return declinations[1];
  if (num == 1) return declinations[0];
  return declinations[2];
}

double getSum(List<ProductEntity> list) {
  double sum = 0;
  for (var e in list) {
    sum += e.price;
  }
  return sum;
}

double getSumWithSale(List<ProductEntity> list) {
  double sum = 0;
  for (var e in list) {
    sum += e.sale > 0.0 ? priceWithSale(e) : e.price;
  }
  return sum;
}

String getSale(double sum, double sumSale) =>
    (100 - (sumSale / sum * 100)).toStringAsFixed(1);
