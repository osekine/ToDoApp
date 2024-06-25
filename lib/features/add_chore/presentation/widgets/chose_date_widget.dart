part of '../screens/new_chore.dart';

class ChoseDateWidget extends StatefulWidget {
  const ChoseDateWidget({
    super.key,
  });

  @override
  State<ChoseDateWidget> createState() => _ChoseDateWidgetState();
}

class _ChoseDateWidgetState extends State<ChoseDateWidget> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Сделать до',
              style: TextOption.getCustomStyle(
                style: TextStyles.body,
                color: colors.onBackground,
              ),
            ),
            if (date != null)
              Text(
                getFormattedDate(date!.toLocal()),
                style: TextOption.getCustomStyle(
                  style: TextStyles.body,
                  color: colors.primary,
                ),
              ),
          ],
        ),
        Switch(
          value: date != null,
          onChanged: ((value) async {
            if (!value) {
              date = null;
              setState(() {});
              return;
            }
            final newDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 1),
            );
            date = newDate;
            setState(() {});
          }),
        ),
      ],
    );
  }
}
