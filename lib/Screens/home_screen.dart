import 'package:flutter/material.dart';

import 'package:mytodoapp/custom_widgets/add_to_list_button.dart';
import 'package:mytodoapp/custom_widgets/tasks_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'ToDo App',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: TasksListWidget(
          onDelete: () {
            setState(() {});
          },
          onEdit: () {
            setState(() {});
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add_box),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddToListButton(
                  onAddToList: () {},
                );
              },
            );
            setState(() {});
          },
        ));
  }
}
