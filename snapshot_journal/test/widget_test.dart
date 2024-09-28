import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snapshot_journal/Object/Entry.dart';
import 'package:camera/camera.dart';
import 'package:snapshot_journal/Widgits/Entry_list.dart';
import 'package:snapshot_journal/Widgits/imageController.dart';
import 'package:snapshot_journal/Widgits/main.dart';
import 'package:snapshot_journal/pages/camera_screen.dart';
import 'package:snapshot_journal/pages/journal_entries.dart';


void main() {
  testWidgets('Journal starts with no entries', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JournalEntries(),
      ));
        
      final entryFinder = find.byType(EntryList);

    expect(entryFinder, findsNothing);

    });


    testWidgets('Take picture button adds entry', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JournalEntries(),
      ));

    await tester.tap(find.byKey(const Key('ToCameraButton'))); //taps button to open camera page
    await tester.pump();
    await tester.tap(find.byKey(const Key("AddEntryButton"))); //test cant find the button on camera page?
    await tester.pump();

    final entryFinder = find.byType(EntryList);

    expect(entryFinder, findsOneWidget); //should find one new entry
      
    });


  }

