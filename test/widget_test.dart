import 'package:flutter/material.dart';
import 'package:flutter_starter_architecture/features/dashboard/data/dashboard_repository.dart';
import 'package:flutter_starter_architecture/features/dashboard/presentation/dashboard_controller.dart';
import 'package:flutter_starter_architecture/features/dashboard/presentation/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the starter dashboard and toggles a checklist item', (
    tester,
  ) async {
    final controller = DashboardController(MockDashboardRepository())..load();

    await tester.pumpWidget(
      MaterialApp(home: DashboardPage(controller: controller)),
    );
    await tester.pumpAndSettle();

    expect(find.text('BUILD WITH INTENT.'), findsOneWidget);
    expect(find.text('Feature-first structure'), findsOneWidget);
    expect(find.text('Define the domain language'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Make state transitions explicit'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Make state transitions explicit'));
    await tester.pump();

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox).at(2));
    expect(checkbox.value, isTrue);

    controller.dispose();
  });
}
