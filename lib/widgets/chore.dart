import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      title: Text(widget.chore.name),
      leading: widget.chore.isDone
          ? const Icon(Icons.check_box)
          : const Icon(Icons.check_box_outline_blank),
      trailing: const Icon(Icons.info_outline),
    );
  }
}
