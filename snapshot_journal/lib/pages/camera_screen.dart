import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:snapshot_journal/Object/Entry.dart';




class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});



  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
      );

      // Initialize the controller
      _initializeControllerFuture = _controller?.initialize();

      // Rebuild the widget after initialization
      setState(() {});
    } else {
      // Handle the case when no cameras are found
      print('No cameras available');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: _controller == null
          ? const Center(child: CircularProgressIndicator()) // Show loading while camera is initializing
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the camera preview.
                  return CameraPreview(_controller!);
                } else {
                  // Otherwise, show a loading spinner.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
      floatingActionButton: _controller != null
          ? FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;

                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath =
                      path.join(directory.path, 'image_${DateTime.now()}.png');

                  final XFile image = await _controller!.takePicture();

                  if (!mounted) return;

                  final newEntry = Entry(imagePath: image.path);

                  Navigator.of(context).pop(newEntry);
                } catch (e) {
                  print('Error taking picture: $e');
                }
              },
              child: const Icon(Icons.camera_alt),
            )
          : null,
    );
  }
}
