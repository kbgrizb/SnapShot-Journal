import 'package:flutter/material.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const JournalEntries(),
    ),
  );
}
