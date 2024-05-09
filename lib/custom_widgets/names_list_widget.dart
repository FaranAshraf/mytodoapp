import 'package:flutter/material.dart';

import 'package:mytodoapp/Functions/getapiresponse.dart';
import 'package:mytodoapp/Screens/selected_student.dart';
import 'package:mytodoapp/custom_widgets/delete_button.dart';
import 'package:mytodoapp/custom_widgets/edit_button.dart';

class NamesListWidget extends StatefulWidget {
  const NamesListWidget({super.key});

  @override
  State<NamesListWidget> createState() => _NamesListWidgetState();
}

class _NamesListWidgetState extends State<NamesListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAPIresponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Display loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Display error if any
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: const Border(
                      bottom: BorderSide(color: Colors.black, width: 2)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectedStudent(
                                studentData: snapshot.data![index])));
                  },
                  tileColor: Colors.yellow,
                  title: Text(snapshot.data![index].name ?? "its null"),
                  subtitle: const Text(
                    'Tap to find Task',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(160, 0, 0, 0)),
                  ),
                  trailing: DeleteButton(
                      onDelete: () {
                        setState(() {});
                      },
                      id: snapshot.data![index].id!,
                      name: snapshot.data![index].name!),
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditButton(
                            name: snapshot.data![index].name!,
                            body: snapshot.data![index].body!,
                            id: snapshot.data![index].id!,
                            onEdit: () {
                              setState(() {});
                            },
                          );
                        });
                  },
                );
              });
        }
      },
    );
  }
}
