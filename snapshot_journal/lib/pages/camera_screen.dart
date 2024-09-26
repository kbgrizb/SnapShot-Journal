
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path; // gives a shortend name for the import
import 'package:path_provider/path_provider.dart';
import "package:snapshot_journal/Object/Entry.dart";
import 'package:flutter/material.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';



class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera
  });

 final CameraDescription camera;

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


    _controller = CameraController(
      widget.camera, 
      ResolutionPreset.high);

      _initializeControllerFuture = _controller.initialize();
  }

  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            // Shows loading indicator while initializing
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Ensure the controller is initialized
            await _initializeControllerFuture;

            // Get the directory to save the picture
            final directory = await getApplicationDocumentsDirectory();
            final imagePath = path.join(directory.path, 'image_${DateTime.now()}.png');

            final XFile image = await _controller.takePicture();

            // If the picture is taken, navigate back to the journal entries
            // and pass the image path to create a new entry
            if (!mounted) return;

            // Create a new entry with the image path
            final newEntry = Entry(imagePath: image.path);

            // Navigate back to the journal entries screen
            Navigator.of(context).pop(newEntry); // Pass the new entry back

          } catch (e) {
            print('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

