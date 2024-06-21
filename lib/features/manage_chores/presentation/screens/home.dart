import 'package:flutter/material.dart';

import '../../../add_chore/presentation/screens/new_chore.dart';
import '../widgets/chore_list_body_widget.dart';
import '../widgets/chore_title_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _controller;

  void _moveSubtitle() {
    if (_controller.offset < 100) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_moveSubtitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const NewChoreScreen()))),
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(controller: _controller, slivers: [
          ChoreTitleAppbar(controller: _controller),
          const ChoreListBodyWidget(),
        ]));
  }
}
