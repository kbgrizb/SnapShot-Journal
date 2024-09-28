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

  await tester.tap(find.byKey(const Key('ToCameraButton')));
  await tester.pumpAndSettle();

  await tester.tap(find.byIcon(Icons.camera_alt_outlined)); // Use icon instead of key
await tester.pumpAndSettle();

  final entryFinder = find.byType(EntryList);
  expect(entryFinder, findsOneWidget);
});

testWidgets('EntryList displays image and text field', (WidgetTester tester) async {
    // Arrange
    final entry = Entry(imagePath: 'path/to/fake_image.png'); // Mock Entry object
    final testWidget = MaterialApp(
      home: Scaffold(
        body: EntryList(entry: entry),
      ),
    );

    // Act
    await tester.pumpWidget(testWidget);

    // Assert
    expect(find.byType(Image), findsOneWidget); // Check if an Image widget is present
    expect(find.byType(TextField), findsOneWidget); // Check if a TextField widget is present

    // Check if the image path is correctly set in the Image widget
    final imageWidget = tester.widget<Image>(find.byType(Image));
    expect((imageWidget.image as FileImage).file.path, equals('path/to/fake_image.png'));

    // Check if the TextField has the correct hint text
    expect(find.text("Write something . . ."), findsOneWidget);
});

}