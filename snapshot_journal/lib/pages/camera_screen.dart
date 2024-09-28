import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

typedef EntryListCallback = Function(String imagePath);

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera,
    required this.newItem,
  });

  final CameraDescription camera;
  final EntryListCallback newItem;

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
            await _initializeControllerFuture;

<<<<<<< Updated upstream
            // Get the directory to save the picture
            final directory = await getApplicationDocumentsDirectory();
            final imagePath =
                path.join(directory.path, 'image_${DateTime.now()}.png');

=======
>>>>>>> Stashed changes
            // Capture the image
            final image = await _controller.takePicture();

            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");
            print("Taking Picture");

            // Pass the image path back
            widget.newItem(image.path);

            // Pop back to the previous screen
            Navigator.pop(context);
          } catch (e) {
            print('Error taking picture: $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

