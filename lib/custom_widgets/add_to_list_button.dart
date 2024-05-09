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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AlertDialog(icon: Center(child: CircularProgressIndicator()))
        : AlertDialog(
            actions: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Add student here',
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (value) async {
                  setState(() {
                    isLoading = true;
                  });
                  await postAPIresponse(name: value, body: bodyController.text);
                  setState(() {
                    isLoading = false;
                    bodyController.clear();
                    nameController.clear();
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
                  setState(() {
                    isLoading = true;
                  });

                  await postAPIresponse(name: nameController.text, body: value);
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
