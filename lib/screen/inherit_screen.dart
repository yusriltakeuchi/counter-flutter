import 'package:flutter/material.dart';

class InheritNose extends InheritedWidget {

  
  final String nouseType;
  InheritNose({Key key, @required this.nouseType, @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritNose oldWidget) => true;

  static InheritNose of(BuildContext context) =>
    context.inheritFromWidgetOfExactType(InheritNose);
}