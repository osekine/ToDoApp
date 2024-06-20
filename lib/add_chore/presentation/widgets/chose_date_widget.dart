import 'package:flutter/material.dart';

class ChoseDateWidget extends StatelessWidget {
  const ChoseDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Сделать до'),
        Switch(value: false, onChanged: ((value) {})),
      ],
    );
  }
}
