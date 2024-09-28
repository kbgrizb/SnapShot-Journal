
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/pages/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:snapshot_journal/Widgits/imageController.dart';

class JournalEntries extends StatefulWidget {
  const JournalEntries({
    super.key,
  });



  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  final List<Entry> entries = [];
  final ImageController imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('\n Welcome to SnapShot!'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.zero,
          child: Text(
              "Welcome to SnapShot! To use Snapshot, add a new picture then enter a text description."),
        ),
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
        onPressed: () async {
          // Find the first available camera
          final cameras = await availableCameras();
          final firstCamera = cameras.first;

          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraScreen(
                camera: firstCamera,
                imageController: imageController,
              ),
            ),
          );

          // Check if an image was captured
          if (imageController.image != null) {
            // Add the new entry to the list with the image
            setState(() {
              entries.add(Entry(imagePath: imageController.image!.path));
              print("hello: " + imageController.image!.path);
            });

            // Clear the image from the controller
            imageController.clear();
          }
        },
      )
  );}
  }
