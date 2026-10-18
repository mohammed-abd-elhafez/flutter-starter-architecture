import '../domain/dashboard_models.dart';

abstract interface class DashboardRepository {
  Future<DashboardSnapshot> loadDashboard();
}

/// Temporary in-memory data source used until a real API or database is added.
class MockDashboardRepository implements DashboardRepository {
  @override
  Future<DashboardSnapshot> loadDashboard() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));

    return const DashboardSnapshot(
      metrics: [
        DashboardMetric(
          label: 'Layers',
          value: '04',
          description: 'Clear boundaries',
          iconCode: 0xe8b6,
        ),
        DashboardMetric(
          label: 'Tests',
          value: '12',
          description: 'Fast feedback loop',
          iconCode: 0xe8f0,
        ),
        DashboardMetric(
          label: 'Docs',
          value: '06',
          description: 'Shared context',
          iconCode: 0xe873,
        ),
      ],
      checklist: [
        ChecklistItem(
          id: 'domain',
          title: 'Define the domain language',
          description: 'Keep business rules independent from Flutter widgets.',
          completed: true,
        ),
        ChecklistItem(
          id: 'data',
          title: 'Hide data sources behind contracts',
          description: 'Swap mock data for an API without rewriting the UI.',
          completed: true,
        ),
        ChecklistItem(
          id: 'state',
          title: 'Make state transitions explicit',
          description: 'Expose loading, success, and error states to the view.',
          completed: false,
        ),
        ChecklistItem(
          id: 'docs',
          title: 'Document decisions, not syntax',
          description: 'Capture the why so future changes stay intentional.',
          completed: false,
        ),
      ],
      principles: [
        ArchitecturePrinciple(
          title: 'Feature-first structure',
          description: 'Keep each product capability close to its data, domain, and presentation code.',
          tag: 'ORGANIZE',
        ),
        ArchitecturePrinciple(
          title: 'Dependency inversion',
          description: 'The controller depends on a repository contract, not a concrete API client.',
          tag: 'DECOUPLE',
        ),
        ArchitecturePrinciple(
          title: 'Documentation as context',
          description: 'Use concise comments for decisions and README files for project-level context.',
          tag: 'EXPLAIN',
        ),
      ],
    );
  }
}
