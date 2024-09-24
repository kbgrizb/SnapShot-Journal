import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';

typedef entryRemoved = Function(Entry entry, bool remove);



class EntryList extends StatelessWidget{

  EntryList(
    {required this.entry}

  );


final Entry entry;



Widget build(BuildContext context) {
  return ListTile(
    leading: Image.network(
      "https://ichef.bbci.co.uk/news/1536/cpsprodpb/89e1/live/5b736ea0-f0e6-11ee-aa67-b5d719b6a777.jpg.webp",
      height: 100,
      width: 100,
      ),
      title: Column(children: [Text(DateTime.now().toString()), 
      TextField(maxLength: 100,)]),

  );



}







}

