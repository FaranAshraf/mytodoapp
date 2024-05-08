import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/postapiresponse.dart';

class AddToListButton extends StatefulWidget {
  final VoidCallback? onAddToList;
  const AddToListButton({super.key, this.onAddToList});

  @override
  State<AddToListButton> createState() => _AddToListButtonState();
}

class _AddToListButtonState extends State<AddToListButton> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Add student here',
          ),
          textInputAction: TextInputAction.send,
          onSubmitted: (value) async {
            postAPIresponse(name: value, body: bodyController.text);
            setState(() {
              nameController.clear();
              bodyController.clear();
              Navigator.pop(context);
              widget.onAddToList?.call();
            });
          },
        ),
        TextField(
          controller: bodyController,
          decoration: const InputDecoration(
            labelText: 'Add Task here',
          ),
          textInputAction: TextInputAction.send,
          onSubmitted: (value) async {
            postAPIresponse(name: nameController.text, body: value);
            setState(() {
              bodyController.clear();
              nameController.clear();
              Navigator.pop(context);
              widget.onAddToList?.call();
            });
          },
        ),
      ],
    );
  }
}
