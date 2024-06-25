import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';
import 'package:to_do_app/features/add_chore/presentation/widgets/delete_description_widget.dart';
import 'package:to_do_app/models/chore.dart';
import 'package:to_do_app/utils/format.dart';
import 'package:to_do_app/utils/logs.dart';
part '../widgets/chose_date_widget.dart';
part '../widgets/description_widget.dart';
part '../widgets/priority_widget.dart';

class NewChoreScreen extends StatelessWidget {
  const NewChoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        forceMaterialTransparency: true,
        surfaceTintColor: colors.surface,
        shadowColor: colors.shadow,
        backgroundColor: colors.background,
        foregroundColor: colors.onBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Logs.log('Poped to HomeScreen');
            Navigator.maybePop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Logs.log('Saved chore');
              Navigator.pop(context);
            },
            child: Text('Сохранить'.toUpperCase(),
                style: TextOption.getCustomStyle(
                    style: TextStyles.button, color: Colors.blue)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
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
            const DeleteDescriptionWidget(),
          ],
        ),
      ),
    );
  }
}
