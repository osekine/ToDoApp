import 'package:flutter/material.dart';
import 'package:to_do_app/features/manage_chores/domain/chore_list_provider.dart';
import 'package:to_do_app/features/add_chore/presentation/screens/new_chore.dart';
import 'package:to_do_app/features/manage_chores/presentation/widgets/chore_title_appbar.dart';
import 'package:to_do_app/features/manage_chores/presentation/widgets/chore.dart';
import 'package:to_do_app/models/chore.dart';
import 'package:to_do_app/models/client.dart';
import 'package:to_do_app/utils/logs.dart';

part 'package:to_do_app/features/manage_chores/presentation/widgets/chore_list_body_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.model});

  final ClientModel<Chore> model;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _controller;
  bool isDoneVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  void toggleVisible() {
    setState(() {
      isDoneVisible = !isDoneVisible;
      Logs.log('Chores visibility changed to $isDoneVisible');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChoreListProvider(
      onToggleVisible: toggleVisible,
      scrollController: _controller,
      client: widget.model,
      isDoneVisible: isDoneVisible,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Logs.log('Pushed to NewChoreScreen');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const NewChoreScreen()),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(
          controller: _controller,
          slivers: const [
            ChoreTitleAppbar(),
            ChoreListBodyWidget(),
          ],
        ),
      ),
    );
  }
}
