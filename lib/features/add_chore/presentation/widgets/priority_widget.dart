import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';
import 'package:to_do_app/models/chore.dart';

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DropdownMenu(
        label: const Text('Важность'),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          labelStyle: TextOption.getCustomStyle(
              style: TextStyles.subtitle, color: colors.onBackground),
        ),
        enableSearch: false,
        menuStyle: MenuStyle(
          surfaceTintColor:
              MaterialStateColor.resolveWith((states) => colors.surface),
          alignment: AlignmentDirectional.topStart,
        ),
        trailingIcon:
            const Icon(Icons.arrow_drop_down, color: Colors.transparent),
        initialSelection: Priority.none,
        dropdownMenuEntries: Priority.values
            .map((e) => DropdownMenuEntry(value: e, label: e.name))
            .toList());
  }
}
