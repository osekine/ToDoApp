import 'package:flutter/material.dart';

import '../../../models/chore.dart';

class ChoreListProvider extends InheritedWidget {
  final List<Chore> chores;
  final bool isDoneVisible;

  const ChoreListProvider(
      {super.key,
      required this.chores,
      required this.isDoneVisible,
      required super.child});

  @override
  bool updateShouldNotify(ChoreListProvider oldWidget) {
    return isDoneVisible != oldWidget.isDoneVisible ||
        chores.length != oldWidget.chores.length;
  }

  static ChoreListProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChoreListProvider>()
        as ChoreListProvider;
  }

  List<Chore> get choreList =>
      isDoneVisible ? chores : chores.where((chore) => !chore.isDone).toList();
}
