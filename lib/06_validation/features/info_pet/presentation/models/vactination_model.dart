import 'package:flutter/material.dart';

class VactinationModel extends ChangeNotifier {
  final String title;
  bool _isSelect = false;
  String _date = '';
  bool isValid = false;

  VactinationModel({required this.title});

  bool get isSelect => _isSelect;
  void change() {
    _isSelect = !_isSelect;
    notifyListeners();
  }

  String get date => _date;

  void setDate(String value) {
    _date = value;
    notifyListeners();
  }

  void clear() {
    _isSelect = false;
    _date = '';
    notifyListeners();
  }

  @override
  String toString() => '$_isSelect = $title: $_date';
}

List<VactinationModel> vactinationWidgetList = [
  VactinationModel(title: 'бешенства'),
  VactinationModel(title: 'ковида'),
  VactinationModel(title: 'малярии')
];
