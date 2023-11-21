import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_bloc.dart';
import 'package:past_calculator/ui/home_screen.dart';

void main() {
  testWidgets('HomeScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CalculatorBloc(),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.text('Main Screen'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('first_number')), '10');
    await tester.enterText(find.byKey(const Key('second_number')), '20');
    await tester.pumpAndSettle();
  });

  testWidgets('Submit Button Tap Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CalculatorBloc(),
          child: const HomeScreen(),
        ),
      ),
    );

    expect(find.byKey(const Key('Submit')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Submit')));

    await tester.pumpAndSettle();
  });
}
