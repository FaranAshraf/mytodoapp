import 'package:flutter/material.dart';
import 'package:mytodoapp/Functions/deleteapiresponse.dart';

class DeleteButton extends StatefulWidget {
  final VoidCallback? onDelete;
  final String id;
  final String name;
  const DeleteButton(
      {super.key, required this.id, required this.name, this.onDelete});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : IconButton(
            onPressed: () async {
              await _showDeleteConfirmationDialog(
                id: widget.id,
                name: widget.name,
              );
            },
            icon: const Icon(Icons.delete),
          );
  }

  Future<void> _showDeleteConfirmationDialog(
      {required String id, required String name}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content: Text('Are you sure you want to delete $name from the List?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onDelete?.call();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                  Navigator.of(context).pop();
                });
                await deleteAPI(id: id);
                setState(() {}); // Refresh UI after deletion

                widget.onDelete?.call();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
