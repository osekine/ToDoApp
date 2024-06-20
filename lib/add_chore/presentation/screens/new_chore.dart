import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';

import '../widgets/chose_date_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/priority_widget.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const DescriptionWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: PriorityWidget(),
            ),
            Divider(color: colors.onSurface),
            const ChoseDateWidget(),
            Divider(color: colors.onSurface),
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
