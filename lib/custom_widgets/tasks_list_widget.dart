import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/api_reference.dart';

import 'package:mytodoapp/Screens/selected_student.dart';
import 'package:mytodoapp/custom_widgets/delete_button.dart';
import 'package:mytodoapp/custom_widgets/edit_button.dart';

class TasksListWidget extends StatefulWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const TasksListWidget({super.key, this.onEdit, this.onDelete});

  @override
  State<TasksListWidget> createState() => _NamesListWidgetState();
}

class _NamesListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIReferences.getAPIresponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedStudent(
                                  id: snapshot.data![index].id!,
                                  onDelete: widget.onDelete,
                                  onEdit: widget.onEdit,
                                )));
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                child: const Text('View Task'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SelectedStudent(
                                                id: snapshot.data![index].id!,
                                              )));
                                },
                              ),

                              EditButton(
                                type: snapshot.data![index].type ?? 'None',
                                title: snapshot.data![index].title ?? "None",
                                body: snapshot.data![index].body ?? "None",
                                id: snapshot.data![index].id!,
                                onEdit: () {
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),

                              //

                              DeleteButton(
                                  onDelete: () {
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  id: snapshot.data![index].id!,
                                  name: snapshot.data![index].title ?? "None")
                            ],
                          );
                        });
                    //
                  },
                  child: Card(
                      color: Colors.yellow,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Title',
                                    style: TextStyle(
                                        fontFamily: 'Roboto', fontSize: 20),
                                  ),
                                  Text(
                                    snapshot.data![index].title ?? 'None',
                                    style: const TextStyle(
                                        fontFamily: 'Merriweather'),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'Type',
                              style:
                                  TextStyle(fontFamily: 'Roboto', fontSize: 20),
                            ),
                            Text(
                              snapshot.data![index].type ?? 'None',
                              style:
                                  const TextStyle(fontFamily: 'Merriweather'),
                            )
                          ],
                        ),
                      )),
                );
              });
        }
      },
    );
  }
}
