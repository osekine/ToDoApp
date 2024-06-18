import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/constants/text.dart';
import 'package:to_do_app/models/chore.dart';

class NewChoreScreen extends StatelessWidget {
  const NewChoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: colors.onBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Сохранить'.toUpperCase(),
                style: TextOption.getCustomStyle(
                    style: TextStyles.button, color: Colors.blue)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              maxLines: null,
              minLines: 5,
              style: TextOption.getCustomStyle(
                  style: TextStyles.body, color: colors.onBackground),
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: colors.surface,
                hintText: 'Что надо сделать...',
                hintStyle: TextOption.getCustomStyle(
                    style: TextStyles.body, color: colors.onSurface),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
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
      ),
    );
  }
}
