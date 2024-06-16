import 'package:flutter/material.dart';

import '../models/chore.dart';
import '../widgets/chore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 16,
        expandedHeight: 100,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(color: theme.colorScheme.background),
          title: Text(
            'Мои дела',
            style: theme.textTheme.titleLarge,
          ),
        ),
      ),
      // SliverToBoxAdapter(
      //   child: Card(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //       child: Column(
      //         children: [
      //           ...dumbell.map((chore) => ChoreWidget(chore)),
      //           const ListTile(
      //             leading: SizedBox(width: 0, height: 0),
      //             title: Text(
      //               'Новое',
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ]));
  }
}
