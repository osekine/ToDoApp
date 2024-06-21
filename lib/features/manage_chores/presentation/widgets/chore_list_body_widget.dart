import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/features/add_chore/presentation/screens/new_chore.dart';
import 'package:to_do_app/features/manage_chores/presentation/widgets/chore.dart';
import 'package:to_do_app/models/chore.dart';

class ChoreListBodyWidget extends StatelessWidget {
  const ChoreListBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: DecoratedSliver(
          decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => index < dumbell.length
                      ? ChoreWidget(dumbell[index])
                      : GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const NewChoreScreen()))),
                          child: const ListTile(
                              leading: SizedBox(width: 0, height: 0),
                              title: Text(
                                'Новое',
                              )),
                        ),
                  childCount: dumbell.length + 1))),
    );
  }
}
