import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';

class ChoreTitleAppbar extends StatelessWidget {
  const ChoreTitleAppbar({
    super.key,
    required ScrollController controller,
  }) : _controller = controller;

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
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
            const Expanded(flex: 1, child: Icon(Icons.visibility_off_outlined))
          ],
        ),
      ),
    );
  }
}
