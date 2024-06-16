import 'package:flutter/material.dart';

import '../models/chore.dart';
import '../widgets/chore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 8,
        expandedHeight: 100,
        // leading: SizedBox(height: 0, width: 0),
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title:
              Text('Мои дела', style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
      SliverToBoxAdapter(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ...dumbell.map((chore) => ChoreWidget(chore)),
                const ListTile(
                  leading: SizedBox(width: 0, height: 0),
                  title: Text(
                    'Новое',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
