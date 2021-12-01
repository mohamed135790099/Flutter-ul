import 'package:flutter/material.dart';

class MyColor extends InheritedWidget {
  final Color color;
  final Widget child;
  MyColor({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyColor oldWidget) {
    return color !=oldWidget.color;

  }

  static MyColor of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<MyColor>() as MyColor;

}
