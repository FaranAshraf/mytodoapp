import 'package:flutter/material.dart';

import 'package:mytodoapp/custom_widgets/add_to_list_button.dart';
import 'package:mytodoapp/custom_widgets/names_list_widget.dart';

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
          title: const Text(
            'ToDo App',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: NamesListWidget(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add_box),
          onPressed: () {
            // Instantiate the AddToListButton widget and display it
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddToListButton(
                  onAddToList: () {
                    setState(() {});
                  },
                );
              },
            );
          },
        ));
  }
}
