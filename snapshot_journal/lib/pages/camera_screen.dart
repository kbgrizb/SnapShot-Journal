import 'package:flutter/material.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
  });
 @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {


  @override
  void initState() {
    super.initState();
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