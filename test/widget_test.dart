// Portfolio Website Widget Test

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfiliodf/app.dart';
import 'package:portfiliodf/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the app builds without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
