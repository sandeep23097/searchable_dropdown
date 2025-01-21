import 'package:flutter_test/flutter_test.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:flutter/material.dart';

void main() {
  group('CustomSearchableDropDown Tests', () {
    testWidgets('Initial State Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomSearchableDropDown(
            items: [
              {'label': 'Option 1', 'value': 1},
              {'label': 'Option 2', 'value': 2}
            ],
            label: 'Select Option',
            onChanged: (_) {},
            dropDownMenuItems: ['Option 1', 'Option 2'],
          ),
        ),
      ));

      // Verify the initial label is displayed correctly.
      expect(find.text('Select Option'), findsOneWidget);
      expect(find.text('Option 1'), findsNothing); // Dropdown should not be visible initially.
    });

    testWidgets('Selection Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomSearchableDropDown(
            items: [
              {'label': 'Option 1', 'value': 1},
              {'label': 'Option 2', 'value': 2}
            ],
            label: 'Select Option',
            onChanged: (_) {},
            dropDownMenuItems: ['Option 1', 'Option 2'],
          ),
        ),
      ));

      // Tap the dropdown to open it.
      await tester.tap(find.text('Select Option'));
      await tester.pumpAndSettle(); // Wait for the dropdown to open.

      // Tap the first item.
      await tester.tap(find.text('Option 1').last);
      await tester.pumpAndSettle();

      // Verify the item is selected and dropdown is closed.
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Select Option'), findsNothing);
    });

    testWidgets('MultiSelect Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomSearchableDropDown(
            items: [
              {'label': 'Option 1', 'value': 1},
              {'label': 'Option 2', 'value': 2}
            ],
            label: 'Select Options',
            onChanged: (_) {},
            dropDownMenuItems: ['Option 1', 'Option 2'],
            multiSelect: true,
          ),
        ),
      ));

      // Tap the dropdown to open it.
      await tester.tap(find.text('Select Options'));
      await tester.pumpAndSettle(); // Wait for the dropdown to open.

      // Select multiple items.
      await tester.tap(find.text('Option 1').last);
      await tester.tap(find.text('Option 2').last);
      await tester.pumpAndSettle();

      // Check if multiple items are selected.
      expect(find.text('Option 1'), findsOneWidget);
      expect(find.text('Option 2'), findsOneWidget);
    });

    testWidgets('Search Functionality Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomSearchableDropDown(
            items: [
              {'label': 'Apple', 'value': 1},
              {'label': 'Banana', 'value': 2}
            ],
            label: 'Select Fruit',
            onChanged: (_) {},
            dropDownMenuItems: ['Apple', 'Banana'],
          ),
        ),
      ));

      // Open the dropdown.
      await tester.tap(find.text('Select Fruit'));
      await tester.pumpAndSettle();

      // Enter search text.
      await tester.enterText(find.byType(TextField), 'Ban');
      await tester.pumpAndSettle();

      // Check if only the matching item is visible.
      expect(find.text('Apple'), findsNothing);
      expect(find.text('Banana'), findsOneWidget);
    });
  });
}

