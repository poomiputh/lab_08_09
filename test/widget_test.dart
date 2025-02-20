// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_08_09/main.dart';

void main() {
  // testWidgets('Autocomplete create test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   final provinceAutocompleteFinder = find.byKey(Key("ProvinceAutocomplete"));
  //   final amphoeAutocompleteFinder = find.byKey(Key("AmphoeAutocomplete"));
  //   final districtAutocompleteFinder = find.byKey(Key("DistrictAutocomplete"));
  //   final zipcodeAutocompleteFinder = find.byKey(Key("ZipcodeAutocomplete"));
  //
  //   expect(provinceAutocompleteFinder, findsOneWidget);
  //   expect(amphoeAutocompleteFinder, findsOneWidget);
  //   expect(districtAutocompleteFinder, findsOneWidget);
  //   expect(zipcodeAutocompleteFinder, findsOneWidget);
  // });

  testWidgets('Create Province Field', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final provinceAutocompleteFinder = find.byKey(Key("ProvinceAutocomplete"));
    expect(provinceAutocompleteFinder, findsOneWidget);
  });

  testWidgets('Autocomplete Province Field', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final provinceAutocompleteFinder = find.byKey(Key("ProvinceAutocomplete"));

    await tester.tap(provinceAutocompleteFinder);
    await tester.pumpAndSettle();

    await tester.enterText(provinceAutocompleteFinder, " ");
    await tester.pumpAndSettle();
    await tester.enterText(provinceAutocompleteFinder, "เชียง");
    await tester.pumpAndSettle();

    expect(find.text('เชียงราย'), findsOne);
  });
}
