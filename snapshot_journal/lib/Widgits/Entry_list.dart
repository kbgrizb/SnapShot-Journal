import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'dart:io';

typedef entryRemoved = Function(Entry entry, bool remove);



class EntryList extends StatelessWidget{
  EntryList(
    {required this.entry, 
    super.key}
    );



final Entry entry;


final DateTime now = DateTime.now();





Widget build(BuildContext context) {
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
      title: Column(children: [Row(children: [Text(now.toString().split(' ')[0])]), // updated the dates position
      TextField(maxLength: 100, decoration: 
      InputDecoration(hintText: "Write something . . .", hintStyle: TextStyle(color: Colors.black.withOpacity(.5))),)]),

  );



}







}

