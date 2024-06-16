import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';

import '../models/chore.dart';

class ChoreWidget extends StatefulWidget {
  final Chore chore;
  const ChoreWidget(this.chore, {super.key});

  @override
  State<ChoreWidget> createState() => _ChoreWidgetState();
}

class _ChoreWidgetState extends State<ChoreWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      title: getChore(context, widget.chore),
      leading: widget.chore.isDone
          ? const Icon(Icons.check_box, color: Colors.green)
          : Icon(Icons.check_box_outline_blank,
              color: widget.chore.priority == Priority.high
                  ? Colors.red
                  : Colors.grey),
      trailing: const Icon(Icons.info_outline),
    );
  }
}

Widget getChore(BuildContext context, Chore chore) {
  final colors = Theme.of(context).colorScheme;
  if (chore.isDone) {
    return Text(chore.name,
        style: const TextStyle(decoration: TextDecoration.lineThrough));
  }

  if (chore.priority == Priority.high) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.priority_high_outlined, color: colors.error),
        Text(chore.name,
            style: TextOption.getCustomStyle(
                style: TextStyles.body, color: colors.onBackground)),
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
        Text(chore.name,
            style: TextOption.getCustomStyle(
                style: TextStyles.body, color: colors.onBackground)),
      ],
    );
  }

  return Text(chore.name,
      style: TextOption.getCustomStyle(
          style: TextStyles.body, color: colors.onBackground));
}
