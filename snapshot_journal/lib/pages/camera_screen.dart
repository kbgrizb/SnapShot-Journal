import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:snapshot_journal/Widgits/imageController.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera,
    required this.imageController,
  });

  final CameraDescription camera;
  final ImageController imageController;

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
      ResolutionPreset.high,
    );

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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Ensure the camera is initialized
            await _initializeControllerFuture;

            // Get the directory to save the picture
            final directory = await getApplicationDocumentsDirectory();
            final imagePath =
                path.join(directory.path, 'image_${DateTime.now()}.png');

            // Capture the image
            final XFile image = await _controller.takePicture();

            // Store the image in the ImageController
            widget.imageController.setImage(File(image.path));

            // Go back to the journal page with the image
            if (!mounted) return;
            Navigator.of(context).pop();
          } catch (e) {
            print('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
