import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';

import '../../../../models/chore.dart';

class ChoreWidget extends StatefulWidget {
  final Chore chore;
  const ChoreWidget(this.chore, {super.key});

  @override
  State<ChoreWidget> createState() => _ChoreWidgetState();
}

class _ChoreWidgetState extends State<ChoreWidget> {
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.chore.hashCode),
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.endToStart) {
          print('delete');
        } else {
          print('confirm');
        }
        return Future.value(false);
      },
      onUpdate: (details) {
        offset = details.progress;
        setState(() {});
      },
      dismissThresholds: const {
        DismissDirection.endToStart: 0.1,
        DismissDirection.startToEnd: 0.1
      },
      background: Container(
        color: Colors.green,
        child: Align(
          alignment: Alignment(((offset / 2 - 1)).clamp(-1, -0.9), 0),
          child: const Icon(Icons.check),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(((1 - offset / 2)).clamp(0.9, 1), 0),
          child: const Icon(Icons.delete_outline),
        ),
      ),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: widget.chore.isDone
                    ? const Icon(Icons.check_box, color: Colors.green)
                    : Icon(Icons.check_box_outline_blank,
                        color: widget.chore.priority == Priority.high
                            ? Colors.red
                            : Colors.grey),
              ),
              Expanded(
                flex: 5,
                child: _getChore(context, widget.chore),
              ),
              const Expanded(flex: 1, child: Icon(Icons.info_outline)),
            ],
          ),
        ),
      ),
    );
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
