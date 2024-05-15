import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/api_reference.dart';

class EditButton extends StatefulWidget {
  final String title;
  final String body;
  final String type;
  final String id;
  final VoidCallback? onEdit;

  const EditButton(
      {super.key,
      required this.id,
      this.onEdit,
      required this.body,
      required this.title,
      required this.type});

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  List<String> taskTypes = ["Normal", "Urgent", "No Need", "None"];
  String? selectedType;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.title;
    bodyController.text = widget.body;
    selectedType = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Edit Title',
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) async {
                            setState(() {
                              isLoading = true;
                              Navigator.of(context).pop();
                            });
                            await APIReferences.putAPI(
                                id: widget.id,
                                title: nameController.text,
                                body: bodyController.text,
                                type: selectedType ?? "None");
                            setState(() {
                              isLoading = false;
                              bodyController.clear();
                              nameController.clear();
                            });
                            widget.onEdit?.call();
                          },
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedType, // Initially selected task type
                          onChanged: (value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                          items: taskTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            labelText: 'Task Type',
                          ),
                        ),
                        TextField(
                          controller: bodyController,
                          decoration: const InputDecoration(
                            labelText: 'Edit Task here',
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (value) async {
                            setState(() {
                              isLoading = true;
                              Navigator.of(context).pop();
                            });
                            await APIReferences.putAPI(
                                id: widget.id,
                                title: nameController.text,
                                body: bodyController.text,
                                type: selectedType ?? "None");
                            setState(() {
                              isLoading = false;
                              bodyController.clear();
                              nameController.clear();
                            });
                            widget.onEdit?.call();
                          },
                        ),
                        TextButton(
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                                Navigator.of(context).pop();
                              });
                              await APIReferences.putAPI(
                                  id: widget.id,
                                  title: nameController.text,
                                  body: bodyController.text,
                                  type: selectedType ?? "None");
                              setState(() {
                                bodyController.clear();
                                nameController.clear();
                                isLoading = false;
                              });
                              widget.onEdit?.call();
                            },
                            child: const Text('Done'))
                      ],
                    );
                  });
            },
            child: const Text('Edit Task'));
  }
}
