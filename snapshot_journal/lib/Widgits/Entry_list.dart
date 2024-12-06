import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'dart:io';

import 'package:snapshot_journal/pages/delete_dialog.dart';

typedef entryRemoved = Function(Entry entry, bool remove);

class EntryList extends StatelessWidget {
  EntryList({required this.entry, required this.onEntryRemoved, super.key});

  final Entry entry;
  // New field for checking if the entry has been removed
  final entryRemoved onEntryRemoved;

  final DateTime now = DateTime.now();

  Widget build(BuildContext context) {
    print("hello again: " + entry.imagePath!);
    return ListTile(
      // Need to implemnt the ability to pull an new image
      leading: entry.imagePath != null
          ? Image.file(
              File(entry.imagePath!),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
          : const Icon(Icons.image, size: 100),
      title: Column(children: [
        Row(children: [
          Text(now.toString().split(' ')[0], style: TextStyle(color: Colors.black, fontFamily: "Hand", fontWeight: FontWeight.bold)),
          const SizedBox(width: 115.0),
          // New delete button for each individual entry
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DeleteDialog(
                  entry: entry,
                  onConfirm: () => onEntryRemoved(entry, true),
                ),
              );
            },
            icon: const Icon(Icons.delete),
            color: Color.fromARGB(255, 255, 0, 0),
          )
        ]), // updated the dates position
        TextField(
          maxLength: 100,
          decoration: InputDecoration(
              hintText: "Write something . . .",
              hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
              counterStyle: TextStyle(color: Colors.black)),
          style: TextStyle(color: Colors.black, fontFamily: "Hand"),
        )
      ]),
    );
  }
}
