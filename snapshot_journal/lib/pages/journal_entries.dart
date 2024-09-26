
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/pages/camera_screen.dart';
import 'package:camera/camera.dart';

class JournalEntries extends StatefulWidget {
  const JournalEntries({
    super.key,
    required this.firstCamera, // Have this here so that it can get the camera picked in main, then apply the given camera to the camera_screen
  });

  final CameraDescription firstCamera;

  });

 @override
  State<JournalEntries> createState() => _JournalEntriesState();
}



class _JournalEntriesState extends State<JournalEntries> {
  final List<Entry> entries = [Entry()];
 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SnapShot!'),
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Text(
                "To use Snapshot, add a new picture then enter a text description.")),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        children: entries.map((entry) {
          return EntryList(
            entry: entry,
          );
        }).toList(),
      ),

    floatingActionButton: FloatingActionButton.extended(
      label: const Text("Entry"),
      icon: const Icon(Icons.camera_alt_outlined),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CameraScreen(camera: widget.firstCamera,)));


        }
          
    )
    );
  
  }

 
  }