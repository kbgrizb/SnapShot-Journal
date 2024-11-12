import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';

class DeleteDialog extends StatelessWidget {
  final Entry entry;
  final VoidCallback onConfirm;

  const DeleteDialog({required this.entry, required this.onConfirm, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete This Entry?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog without deleting
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 15.0),
          ),
        ),
        SizedBox(
          width: 115.0,
        ),
        TextButton(
          onPressed: () {
            onConfirm(); // Confirm delete action
            Navigator.of(context).pop();
          },
          child: const Text("Delete",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 15.0)),
        ),
      ],
    );
  }
}
