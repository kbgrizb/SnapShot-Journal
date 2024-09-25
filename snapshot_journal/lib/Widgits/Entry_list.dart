import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';

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
    leading: Image.network(
      "https://ichef.bbci.co.uk/news/1536/cpsprodpb/89e1/live/5b736ea0-f0e6-11ee-aa67-b5d719b6a777.jpg.webp",
      height: 200,
      width: 150,
      ),
      title: Column(children: [Row(children: [Text(now.toString().split(' ')[0])]), // updated the dates position
      TextField(maxLength: 100, decoration: 
      InputDecoration(hintText: "Write something . . .", hintStyle: TextStyle(color: Colors.black.withOpacity(.5))),)]),

  );



}







}

