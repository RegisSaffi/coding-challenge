// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge/main.dart';

void main() {
  testWidgets('Ensure that some widgets are available', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChallengeApp());

    expect(find.text('Invitation'), findsOneWidget);
    expect(find.text('My team'), findsOneWidget);

    expect(find.text('You have 5 friends'), findsWidgets);


  });
}
