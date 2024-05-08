import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/putapiresponse.dart';

class EditButton extends StatefulWidget {
  final String name;
  final String body;
  final String id;
  final VoidCallback? onEdit;

  const EditButton(
      {super.key,
      required this.id,
      this.onEdit,
      required this.body,
      required this.name});

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    bodyController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Edit student name here',
          ),
          textInputAction: TextInputAction.send,
          onSubmitted: (value) async {
            putAPI(id: widget.id, name: value, body: bodyController.text);
            setState(() {
              nameController.clear();
            });
            Navigator.pop(context);
            widget.onEdit?.call();
          },
        ),
        TextField(
          controller: bodyController,
          decoration: const InputDecoration(
            labelText: 'Edit Task here',
          ),
          textInputAction: TextInputAction.send,
          onSubmitted: (value) async {
            putAPI(id: widget.id, name: nameController.text, body: value);
            setState(() {
              bodyController.clear();
            });
            Navigator.pop(context);
            widget.onEdit?.call();
          },
        ),
      ],
    );
  }
}
