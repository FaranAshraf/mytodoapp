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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    bodyController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AlertDialog(icon: Center(child: CircularProgressIndicator()))
        : AlertDialog(
            actions: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Edit student name here',
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (value) async {
                  setState(() {
                    isLoading = true;
                  });
                  await putAPI(
                      id: widget.id, name: value, body: bodyController.text);
                  setState(() {
                    bodyController.clear();
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
                  setState(() {
                    isLoading = true;
                  });
                  await putAPI(
                      id: widget.id, name: nameController.text, body: value);
                  setState(() {
                    bodyController.clear();
                    nameController.clear();
                  });
                  Navigator.pop(context);
                  widget.onEdit?.call();
                },
              ),
            ],
          );
  }
}
