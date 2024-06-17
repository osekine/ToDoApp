import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';

import '../models/chore.dart';

class ChoreWidget extends StatelessWidget {
  final Chore chore;
  const ChoreWidget(this.chore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: chore.isDone
                ? const Icon(Icons.check_box, color: Colors.green)
                : Icon(Icons.check_box_outline_blank,
                    color: chore.priority == Priority.high
                        ? Colors.red
                        : Colors.grey),
          ),
          Expanded(
            flex: 5,
            child: _getChore(context, chore),
          ),
          const Expanded(flex: 1, child: Icon(Icons.info_outline)),
        ],
      ),
    );
    // ListTile(
    //   contentPadding:
    //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
    //   title: getChore(context, widget.chore),
    //   leading: widget.chore.isDone
    //       ? const Icon(Icons.check_box, color: Colors.green)
    //       : Icon(Icons.check_box_outline_blank,
    //           color: widget.chore.priority == Priority.high
    //               ? Colors.red
    //               : Colors.grey),
    //   trailing: const Icon(Icons.info_outline),
    // );
  }
}

Widget _getChore(BuildContext context, Chore chore) {
  final colors = Theme.of(context).colorScheme;
  if (chore.isDone) {
    return Text(
      chore.name,
      style: TextOption.getCustomStyle(
          style: TextStyles.body,
          color: colors.onSurface,
          decoration: TextDecoration.lineThrough),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  if (chore.priority == Priority.high) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.priority_high_outlined, color: colors.error),
        Expanded(
          child: Text(
            chore.name,
            style: TextOption.getCustomStyle(
                style: TextStyles.body, color: colors.onBackground),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  if (chore.priority == Priority.low) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.arrow_downward_outlined,
        ),
        Expanded(
          child: Text(
            chore.name,
            style: TextOption.getCustomStyle(
                style: TextStyles.body, color: colors.onBackground),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  return Text(
    chore.name,
    style: TextOption.getCustomStyle(
      style: TextStyles.body,
      color: colors.onBackground,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 3,
  );
}
