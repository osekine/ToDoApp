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
      title: Text(widget.chore.name),
      leading: widget.chore.isDone
          ? const Icon(Icons.check)
          : const Icon(Icons.close),
      trailing: const Icon(Icons.info),
    );
  }
}
