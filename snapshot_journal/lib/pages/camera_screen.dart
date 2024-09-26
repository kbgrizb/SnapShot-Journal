import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:snapshot_journal/pages/journal_entries.dart'; // gives a shortend name for the import


class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
  });
 @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _initializeCamera() async { // "Future" helps with the intializing of the camera like catching erros, execution time, etc.
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }



  @override
  Widget build(BuildContext context)  {
    return Scaffold(
    body: const Text('This is the camera page'),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.save_alt_outlined),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JournalEntries()),
        );
      }

    )
    );
  
  }

 
  }