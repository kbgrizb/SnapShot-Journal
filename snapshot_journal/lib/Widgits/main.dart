import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();



  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: const JournalEntries(
       
      ),
    ),
  );
}
