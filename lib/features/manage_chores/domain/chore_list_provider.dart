import 'package:flutter/material.dart';

import '../../../models/chore.dart';

class ChoreListProvider extends InheritedWidget {
  final List<Chore> chores;
  final bool isDoneVisible;
  final ScrollController scrollController;
  final VoidCallback onToggleVisible;

  const ChoreListProvider({
    super.key,
    required this.chores,
    required this.isDoneVisible,
    required this.scrollController,
    required this.onToggleVisible,
    required super.child,
  });

  @override
  bool updateShouldNotify(ChoreListProvider oldWidget) {
    return isDoneVisible != oldWidget.isDoneVisible ||
        chores.length != oldWidget.chores.length;
  }

  static ChoreListProvider? maybeOf(
    BuildContext context, {
    required bool listen,
  }) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<ChoreListProvider>()
          : context.getInheritedWidgetOfExactType();

  static ChoreListProvider of(BuildContext context) =>
      maybeOf(context, listen: true)!;

  List<Chore> get choreList =>
      isDoneVisible ? chores : chores.where((chore) => !chore.isDone).toList();

  int get doneCount => chores.where((chore) => chore.isDone).length;

  void tryAddScrollListener(VoidCallback listener) =>
      scrollController.hasClients
          ? scrollController.addListener(listener)
          : null;
}
