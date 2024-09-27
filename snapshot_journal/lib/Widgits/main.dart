import 'package:flutter/material.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';
import 'package:camera/camera.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras(); // Seems to be having issues with await
  final firstCamera = cameras.first;
  

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: JournalEntries(firstCamera: firstCamera
       
      ),
    ),
  );
}
