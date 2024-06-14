import 'package:flutter/material.dart';

class ChangeNotifierProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  final Model model;

  const ChangeNotifierProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            ChangeNotifierProvider<Model>>()
        ?.widget;
    return widget is ChangeNotifierProvider<Model> ? widget.model : null;
  }
}
