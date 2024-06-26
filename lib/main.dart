import 'package:flutter/material.dart';
import 'package:to_do_app/constants/themes.dart';
import 'package:to_do_app/features/manage_chores/presentation/screens/home.dart';
import 'package:to_do_app/models/chore.dart';
import 'package:to_do_app/models/client.dart';
import 'package:to_do_app/utils/logs.dart';

void main() {
  Logs.log('App started');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ClientModel<Chore>(data: dumbell);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: darkTheme,
      home: HomeScreen(model: model),
    );
  }
}
