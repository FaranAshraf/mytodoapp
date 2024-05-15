import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/api_reference.dart';

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
  List<String> taskTypes = ["Normal", "Urgent", "No Need", "None"];
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AlertDialog(icon: Center(child: CircularProgressIndicator()))
        : AlertDialog(
            actions: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Add title here',
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (value) async {
                  setState(() {
                    isLoading = true;
                  });
                  await APIReferences.postAPIresponse(
                    title: nameController.text,
                    body: bodyController.text,
                    type: selectedType ?? "None",
                  );
                  setState(() {
                    isLoading = false;
                    bodyController.clear();
                    nameController.clear();
                    Navigator.pop(context);
                    widget.onAddToList?.call();
                  });
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
                  labelText: 'Add Task description here',
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (value) async {
                  setState(() {
                    isLoading = true;
                  });

                  await APIReferences.postAPIresponse(
                      title: nameController.text,
                      body: bodyController.text,
                      type: selectedType ?? "None");
                  setState(() {
                    bodyController.clear();
                    nameController.clear();
                    isLoading = false;
                    widget.onAddToList?.call();
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await APIReferences.postAPIresponse(
                        title: nameController.text,
                        body: bodyController.text,
                        type: selectedType ?? "None");
                    setState(() {
                      bodyController.clear();
                      nameController.clear();
                      isLoading = false;
                      widget.onAddToList?.call();
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Done'))
            ],
          );
  }
}
