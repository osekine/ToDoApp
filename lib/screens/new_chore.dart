import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/models/chore.dart';

class NewChoreScreen extends StatelessWidget {
  const NewChoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Сохранить'),
          )
        ],
      ),
      body: ListView(
        children: [
          const TextField(),
          DropdownMenu(
              dropdownMenuEntries: Priority.values
                  .map((e) => DropdownMenuEntry(value: e, label: e.name))
                  .toList()),
          const Divider(),
          Row(
            children: [
              const Text('Сделать до'),
              Switch(value: false, onChanged: ((value) {})),
            ],
          ),
          const Divider(),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
              label: const Text('Удалить')),
        ],
      ),
    );
  }
}
