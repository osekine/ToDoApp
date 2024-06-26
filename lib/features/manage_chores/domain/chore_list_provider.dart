import 'package:flutter/material.dart';
import 'package:to_do_app/models/chore.dart';
import 'package:to_do_app/models/client.dart';

class ChoreListProvider extends InheritedWidget {
  final ClientModel<Chore> client;
  final bool isDoneVisible;
  final ScrollController scrollController;
  final VoidCallback onToggleVisible;

  const ChoreListProvider({
    super.key,
    required this.client,
    required this.isDoneVisible,
    required this.scrollController,
    required this.onToggleVisible,
    required super.child,
  });

  @override
  bool updateShouldNotify(ChoreListProvider oldWidget) {
    return isDoneVisible != oldWidget.isDoneVisible ||
        client.data != oldWidget.client.data; //временная заглушка
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

  List<Chore> get choreList => isDoneVisible
      ? client.data ?? []
      : client.data?.where((chore) => !chore.isDone).toList() ?? [];

  int get doneCount => client.data?.where((chore) => chore.isDone).length ?? 0;

  void tryAddScrollListener(VoidCallback listener) =>
      scrollController.hasClients
          ? scrollController.addListener(listener)
          : null;
}
