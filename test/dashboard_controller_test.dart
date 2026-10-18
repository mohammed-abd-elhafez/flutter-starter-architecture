import 'package:flutter_starter_architecture/features/dashboard/data/dashboard_repository.dart';
import 'package:flutter_starter_architecture/features/dashboard/domain/dashboard_models.dart';
import 'package:flutter_starter_architecture/features/dashboard/presentation/dashboard_controller.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeDashboardRepository implements DashboardRepository {
  @override
  Future<DashboardSnapshot> loadDashboard() async {
    return const DashboardSnapshot(
      metrics: [],
      checklist: [
        ChecklistItem(
          id: 'one',
          title: 'First item',
          description: 'First description',
          completed: false,
        ),
        ChecklistItem(
          id: 'two',
          title: 'Second item',
          description: 'Second description',
          completed: true,
        ),
      ],
      principles: [],
    );
  }
}

void main() {
  test('loads data and calculates completion rate', () async {
    final controller = DashboardController(_FakeDashboardRepository());

    await controller.load();

    expect(controller.errorMessage, isNull);
    expect(controller.completedItems, 1);
    expect(controller.completionRate, 0.5);
  });

  test('toggles only the requested checklist item', () async {
    final controller = DashboardController(_FakeDashboardRepository());
    await controller.load();

    controller.toggleChecklistItem('one');

    expect(controller.snapshot!.checklist.first.completed, isTrue);
    expect(controller.snapshot!.checklist.last.completed, isTrue);
    expect(controller.completedItems, 2);
  });
}
