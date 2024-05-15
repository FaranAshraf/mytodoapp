import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/api_reference.dart';

import 'package:mytodoapp/custom_widgets/delete_button.dart';
import 'package:mytodoapp/custom_widgets/edit_button.dart';

class SelectedStudent extends StatefulWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String id;
  const SelectedStudent(
      {super.key, this.onDelete, this.onEdit, required this.id});

  @override
  State<SelectedStudent> createState() => _SelectedStudentState();
}

class _SelectedStudentState extends State<SelectedStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: APIReferences.getSingleTask(id: widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Display loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // Display error if any
              } else {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 40, top: 20),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Title',
                                      style: TextStyle(fontFamily: 'Roboto'),
                                    ),
                                    Text(
                                      snapshot.data!.title ?? "None",
                                      style: const TextStyle(
                                          fontFamily: 'Merriweather'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 40, top: 20),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Type',
                                        style: TextStyle(fontFamily: 'Roboto')),
                                    Text(
                                      snapshot.data!.type ?? "None",
                                      style: const TextStyle(
                                          fontFamily: 'Merriweather'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 300,
                            margin: EdgeInsets.only(bottom: 40, top: 30),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Description",
                                        style: TextStyle(fontFamily: 'Roboto')),
                                    Text(
                                      snapshot.data!.body ?? "None",
                                      style: const TextStyle(
                                          fontFamily: 'Merriweather'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              DeleteButton(
                                  id: snapshot.data!.id!,
                                  name: snapshot.data!.title ?? 'None',
                                  onDelete: () {
                                    setState(() {});
                                    widget.onDelete?.call();
                                    Navigator.pop(context);
                                  }),
                              const Spacer(),
                              EditButton(
                                  id: snapshot.data!.id!,
                                  body: snapshot.data!.body ?? 'None',
                                  title: snapshot.data!.title ?? "None",
                                  type: snapshot.data!.type ?? "None",
                                  onEdit: () {
                                    setState(() {});

                                    widget.onEdit?.call();

                                    //why not rebuilding selected screen state after editbutton pressed..??
                                  })
                            ],
                          )
                        ]),
                  ),
                );
              }
            }));
  }
}
