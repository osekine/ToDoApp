import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/text.dart';
import '../models/chore.dart';
import '../widgets/chore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _controller;

  void _moveSubtitle() {
    if (_controller.offset < 100) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_moveSubtitle);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(controller: _controller, slivers: [
      SliverAppBar(
        surfaceTintColor: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.shadow,
        elevation: 16,
        expandedHeight: 100,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(color: theme.colorScheme.background),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Positioned(
                      left: 0,
                      bottom: _controller.hasClients
                          ? (20 - _controller.offset).clamp(0, 20)
                          : 20,
                      child: Text(
                        'Мои дела',
                        style: TextOption.getCustomStyle(
                            style: TextStyles.title,
                            color: theme.colorScheme.onBackground),
                      ),
                    ),
                    Opacity(
                      opacity: _controller.hasClients
                          ? (1 - _controller.offset / 10).clamp(0, 1)
                          : 1,
                      child: Text(
                        'Выполнено дел - 0',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  flex: 1, child: Icon(Icons.visibility_off_outlined))
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        sliver: DecoratedSliver(
            decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => index < dumbell.length
                        ? ChoreWidget(dumbell[index])
                        : const ListTile(
                            leading: SizedBox(width: 0, height: 0),
                            title: Text(
                              'Новое',
                            )),
                    childCount: dumbell.length + 1))),
      ),
    ]));
  }
}
