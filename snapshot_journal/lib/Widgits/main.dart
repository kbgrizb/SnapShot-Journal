import 'package:flutter/material.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';

void main() {
  runApp(const MaterialApp(
    title: "Journal",
    home: JournalList(),
  ));
}

// Changing StatelessWidget to StatefulWidget
class JournalList extends StatefulWidget {
  const JournalList({super.key});

  @override
  State<JournalList> createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  final List<Entry> entries = [
    Entry(
        description:
            "Spent some time hanging around cliffs, kinda cool I guess")
  ];

  final _entrySet = <Entry>{};

  @override
  void initState() {
    super.initState();
  }

  // Moving build method inside the _JournalListState class
  @override
  Widget build(BuildContext context) {
    //found how to make title and heaader here: https://stackoverflow.com/questions/53880293/flutter-how-to-get-subtext-aligned-under-title-in-appbar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SnapShot!'),
        centerTitle: true,
        bottom: const PreferredSize(
            preferredSize: Size.zero,
            child: Text(
                "To use Snapshot, add a new picture then enter a text description.")),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        children: entries.map((entry) {
          return EntryList(
            entry: entry,
          );
        }).toList(),
      ),
    );
  }
}
