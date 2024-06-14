import 'package:flutter/material.dart';

import '../models/chore.dart';
import '../widgets/chore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Мои дела'),
        ),
        body: Card(
          child: ListView(
            children: [...dumbell.map((chore) => ChoreWidget(chore))],
          ),
        ));
  }
}
