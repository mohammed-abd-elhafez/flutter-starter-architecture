class DashboardMetric {
  const DashboardMetric({
    required this.label,
    required this.value,
    required this.description,
    required this.iconCode,
  });

  final String label;
  final String value;
  final String description;
  final int iconCode;
}

class ChecklistItem {
  const ChecklistItem({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  final String id;
  final String title;
  final String description;
  final bool completed;

  ChecklistItem copyWith({bool? completed}) {
    return ChecklistItem(
      id: id,
      title: title,
      description: description,
      completed: completed ?? this.completed,
    );
  }
}

class ArchitecturePrinciple {
  const ArchitecturePrinciple({
    required this.title,
    required this.description,
    required this.tag,
  });

  final String title;
  final String description;
  final String tag;
}

class DashboardSnapshot {
  const DashboardSnapshot({
    required this.metrics,
    required this.checklist,
    required this.principles,
  });

  final List<DashboardMetric> metrics;
  final List<ChecklistItem> checklist;
  final List<ArchitecturePrinciple> principles;

  DashboardSnapshot copyWith({List<ChecklistItem>? checklist}) {
    return DashboardSnapshot(
      metrics: metrics,
      checklist: checklist ?? this.checklist,
      principles: principles,
    );
  }
}
